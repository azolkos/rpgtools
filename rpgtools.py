import sqlite3, random, math
from flask import Flask, render_template, g, request

app = Flask(__name__)

DATABASE = 'db/main.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def query_db(query, args=(), one=False):
    cur = get_db().execute(query, args)
    rv = cur.fetchall()
    cur.close()
    return (rv[0] if rv else None) if one else rv

def update_npcs(keys, form):
    npc_sheets = {}
    npc_ids = list(set([int(x[0]) for x in keys if x[0] != '0']))

    for npc in npc_ids:
        handle = form[f'{npc}_handle']
        role = form[f'{npc}_role']

        stat_vals = {}
        for stat in [x for x in keys if int(x[0]) == npc and x[1] == 'stats']:
            stat_vals[stat[2]] = int(form['_'.join(stat)])
        stat_sum = sum([int(x) for x in stat_vals.values()])

        skill_vals = {}
        for skill in [x for x in keys if int(x[0]) == npc and x[1] == 'skills']:
            skill_stat = query_db(f'select stat_id from skills where skill="{skill[2]}"')[0]
            skill_vals[skill[2]] = [form['_'.join(skill)], skill_stat[0]]

        weapon_vals = []
        for weapon in [x for x in keys if int(x[0]) == npc and x[1] == 'weapon']:
            w = form['_'.join(weapon)].replace('"','""')
            print(w)
            w_db = query_db(f'select * from weapons where name="{w}"')
            for r in w_db:
                if r != []:
                    weapon_vals.append(r)

        armor_vals_1 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_helmet"]}"')
        armor_vals_2 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_jacket"]}"')
        armor_vals_3 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_vest"]}"')
        armor_vals_4 = query_db(f'select * from armor where material || " " || type="{form[str(npc)+"_armor_pants"]}"')
        armor_vals_1 = armor_vals_1[0] if armor_vals_1 != [] else {'material': None, 'type': None}
        armor_vals_2 = armor_vals_2[0] if armor_vals_2 != [] else {'material': None, 'type': None}
        armor_vals_3 = armor_vals_3[0] if armor_vals_3 != [] else {'material': None, 'type': None}
        armor_vals_4 = armor_vals_4[0] if armor_vals_4 != [] else {'material': None, 'type': None}
        
        armor_sp = query_db(f'''
            select sum(sp_head) sp_head, sum(sp_torso) sp_torso, sum(sp_larm) sp_larm, sum(sp_rarm) sp_rarm, sum(sp_lleg) sp_lleg, sum(sp_rleg) sp_rleg
            from armor
            where material || ' ' || type in (
                '{armor_vals_1['material']} {armor_vals_1['type']}',
                '{armor_vals_2['material']} {armor_vals_2['type']}',
                '{armor_vals_3['material']} {armor_vals_3['type']}',
                '{armor_vals_4['material']} {armor_vals_4['type']}'
            )
        ''')[0]

        cstat_vals = compute_stats(stat_vals)

        npc_sheets[npc] = {
                'handle': handle,
                'role': role,
                'stat_vals': stat_vals,
                'stat_sum': stat_sum,
                'skill_vals': skill_vals,
                'weapon_vals': weapon_vals,
                'armor_vals': [armor_vals_1,armor_vals_2,armor_vals_3,armor_vals_4],
                'armor_sp': armor_sp,
                'cstat_vals': cstat_vals
        }
    return npc_sheets

def compute_stats(stat_vals):
    cstat_db = query_db('select * from stats where type != "primary" or type is null order by idx, idy')
    cstat_rows = max([cstat['idx'] for cstat in cstat_db])
    cstat_cols = max([cstat['idy'] for cstat in cstat_db])
    cstat_vals = []
    for i in range(cstat_rows):
        sub = []
        for j in range(cstat_cols):
            item = list(filter(lambda x: x['idx'] == i+1 and x['idy'] == j+1, cstat_db))
            if item == []:
                sub.append(None)
            else:
                if item[0]['type'] != None and item[0]['multiplier'] != None:
                    sub.append([item[0]['stat'], item[0]['multiplier'] * stat_vals[item[0]['type']]])
                elif item[0]['stat'] == 'BTM':
                    body_type = query_db(f'select * from body_types where pts_from <= {stat_vals["BODY"]} and coalesce(pts_to,"9999") >= {stat_vals["BODY"]}')[0]
                    sub.append([item[0]['stat'], body_type['modifier']])
                else:
                    sub.append([item[0]['stat'], 0])
        cstat_vals.append(sub)
    return cstat_vals

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

@app.route('/')
def start():
    return render_template('home.j2')

@app.route('/npcgenerator', methods=['GET','POST'])
def npcgenerator():
    roles = query_db('select * from roles')

    if request.method == 'GET':
        return render_template('npcgenerator.j2', roles=roles)

    if request.method == 'POST':

        # Get current npc sheets
        keys = [x.split('_') for x in request.form.keys()]
            # for item in keys:
                # tutaj mamy dostep do wszystkich danych z kart postaci juz wygenerowanych oraz modyfikacje uzytkownika
                # print(item,request.form['_'.join(item)])
        npc_id = int(max([x[0] for x in keys])) + 1

        npc_sheets = update_npcs(keys, request.form)

        if '0_update' not in list(request.form.keys()):

            # Get role
            role = request.form['0_role']
            if role == 'Random':
                role = random.choice(roles)[0]

            # Generate primary stats
            stat_db = query_db('select * from stats where type = "primary" order by idx')
            stat_vals = {}
            for stat in stat_db:
                d6_1 = random.randint(1,6)
                d6_2 = random.randint(1,6)
                while d6_1 + d6_2 >= 11:
                    d6_1 = random.randint(1,6)
                    d6_2 = random.randint(1,6)
                stat_vals[stat[0]] = d6_1+d6_2
            stat_sum = sum(stat_vals.values())

            # Generate skills
            skill_db = query_db(f'select cs.role_id, cs.skill_id, s.stat_id from career_skills cs join skills s on s.skill = cs.skill_id where role_id="{role}"')
            skill_vals = {}
            for skill in skill_db:
                skill_vals[skill['skill_id']] = random.randint(1,100)
            s = sum(skill_vals.values())
            for k, v in skill_vals.items():
                skill_vals[k] = math.ceil(v / s * 40)
            for skill in skill_db:
                skill_vals[skill['skill_id']] = [skill_vals[skill['skill_id']], skill['stat_id']]

            # Generate Weapons
            # weapon_pts = random.randint(1,10)
            # weapon_roll_db = query_db(f'select weapon_type, weapon_subtype from npc_weapon_roll where pts_from <= {weapon_pts} and coalesce(pts_to,99) >= {weapon_pts}')[0]
            # weapon_db = query_db(f'select * from weapons where type="{weapon_roll_db["weapon_type"]}" and subtype="{weapon_roll_db["weapon_subtype"]}"')
            weapon_db = query_db(f'select * from weapons')
            weapon_vals = random.choices(weapon_db, k=2)

            # Generate Armor
            # armor_pts = random.randint(1,10)
            # armor_roll_db = query_db(f'select material from npc_armor_roll where pts_from <= {armor_pts} and coalesce(pts_to,99) >= {armor_pts}')[0]
            # armor_db = query_db(f'select * from armor where material="{armor_roll_db["material"]}"')
            armor_db_1 = query_db('select * from armor where type="Helmet" order by sp_head,sp_torso,sp_larm,sp_lleg')
            armor_db_2 = query_db('select * from armor where type="Jacket" order by sp_head,sp_torso,sp_larm,sp_lleg')
            armor_db_3 = query_db('select * from armor where type="Vest" order by sp_head,sp_torso,sp_larm,sp_lleg')
            armor_db_4 = query_db('select * from armor where type="Pants" order by sp_head,sp_torso,sp_larm,sp_lleg')
            armor_vals_1 = random.choice(armor_db_1)
            armor_vals_2 = random.choice(armor_db_2)
            armor_vals_3 = random.choice(armor_db_3)
            armor_vals_4 = random.choice(armor_db_4)

            # Generate computed armor sp
            armor_sp = query_db(f'''
                select sum(sp_head) sp_head, sum(sp_torso) sp_torso, sum(sp_larm) sp_larm, sum(sp_rarm) sp_rarm, sum(sp_lleg) sp_lleg, sum(sp_rleg) sp_rleg
                from armor
                where material || ' ' || type in (
                    '{armor_vals_1['material']} {armor_vals_1['type']}',
                    '{armor_vals_2['material']} {armor_vals_2['type']}',
                    '{armor_vals_3['material']} {armor_vals_3['type']}',
                    '{armor_vals_4['material']} {armor_vals_4['type']}'
                )
            ''')[0]

            # Generate computed stats
            cstat_vals = compute_stats(stat_vals)

            npc_sheets[npc_id] = {
                    'handle': '',
                    'role': role,
                    'stat_vals': stat_vals,
                    'stat_sum': stat_sum,
                    'skill_vals': skill_vals,
                    'weapon_vals': weapon_vals,
                    'armor_vals': [armor_vals_1,armor_vals_2,armor_vals_3,armor_vals_4],
                    'armor_sp': armor_sp,
                    'cstat_vals': cstat_vals
            }

        # Weapons
        weapons = query_db('''
            select wcs.idx, wcs.cat, w.name
            from weapons w
            join weapon_types wt on wt.id = w.type
            left join weapon_subtypes ws on ws.id = w.subtype
            join weapon_cat_sort wcs on wcs.cat = coalesce(ws.name || ' ', '') || wt.name || 's'
            order by wcs.idx
        ''')
        weapons_cat = query_db('select * from weapon_cat_sort order by idx')

        # Armor
        armor_db_1 = query_db('select * from armor where type="Helmet" order by sp_head,sp_torso,sp_larm,sp_lleg')
        armor_db_2 = query_db('select * from armor where type="Jacket" order by sp_head,sp_torso,sp_larm,sp_lleg')
        armor_db_3 = query_db('select * from armor where type="Vest" order by sp_head,sp_torso,sp_larm,sp_lleg')
        armor_db_4 = query_db('select * from armor where type="Pants" order by sp_head,sp_torso,sp_larm,sp_lleg')

        # Body parts
        bodyparts = query_db('select * from body_parts order by idx')

        # Wounds
        wounds = query_db('select * from wounds order by stun_save_mod desc')
        wounds_max = max([x[2] for x in wounds])
        wounds_min = min([x[2] for x in wounds])

        return render_template('npcgenerator.j2',
            roles=roles,
            weapons=weapons,
            weapons_cat=weapons_cat,
            armor=[armor_db_1,armor_db_2,armor_db_3,armor_db_4],
            bodyparts=bodyparts,
            wounds=wounds,
            wounds_max=wounds_max,
            wounds_min=wounds_min,
            npc_sheets=npc_sheets
        )

if __name__ == '__main__':
    app.run( debug = True)