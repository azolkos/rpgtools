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
        # Get role
        role = request.form['role_select']
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
        weapon_pts = random.randint(1,10)
        weapon_roll_db = query_db(f'select weapon_type, weapon_subtype from npc_weapon_roll where pts_from <= {weapon_pts} and coalesce(pts_to,99) >= {weapon_pts}')[0]
        weapon_db = query_db(f'select * from weapons where type="{weapon_roll_db["weapon_type"]}" and subtype="{weapon_roll_db["weapon_subtype"]}"')
        weapon_vals = random.choice(weapon_db)

        # Generate Armor
        armor_pts = random.randint(1,10)
        armor_roll_db = query_db(f'select material from npc_armor_roll where pts_from <= {armor_pts} and coalesce(pts_to,99) >= {armor_pts}')[0]
        armor_db = query_db(f'select * from armor where material="{armor_roll_db["material"]}"')
        armor_vals = random.choice(armor_db)

        # Generate computed stats
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

        # Body parts
        bodyparts = query_db('select * from body_parts order by idx')

        # Wounds
        wounds = query_db('select * from wounds order by stun_save_mod desc')
        wounds_max = max([x[2] for x in wounds])
        wounds_min = min([x[2] for x in wounds])

        npc_sheets = {
            1: {'role': role, 'stat_vals': stat_vals, 'stat_sum': stat_sum, 'skill_vals': skill_vals, 'weapon_vals': weapon_vals, 'armor_vals': armor_vals, 'cstat_vals': cstat_vals}
        }

        return render_template('npcgenerator.j2', 
            roles=roles,
            bodyparts=bodyparts,
            wounds=wounds,
            wounds_max=wounds_max,
            wounds_min=wounds_min,
            npc_sheets=npc_sheets
        )

if __name__ == '__main__':
    app.run( debug = True)