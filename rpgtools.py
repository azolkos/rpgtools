import sqlite3, random, math
from flask import Flask, render_template, g, request
from modules.db import get_globals
from modules.npc_update import update_npcs
from modules.npc_generate import generate_npc

app = Flask(__name__)

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

    DB = get_globals()

    if request.method == 'GET':
        return render_template('npcgenerator.j2', levels=DB['LEVELS'], roles=DB['ROLES'])

    if request.method == 'POST':

        # Get current npc sheets
        keys = [x.split('_') for x in request.form.keys()]

        npc_sheets = update_npcs(keys, request.form, DB)

        if '0_update' not in list(request.form.keys()):

            # Get level
            level = request.form['0_level']
            if level == 'Random':
                level = random.choice(DB['LEVELS'])[0]

            # Get role
            role = request.form['0_role']
            if role == 'Random':
                role = random.choice(DB['ROLES'])[0]

            # Get new npc_id
            npc_id = int(max([x[0] for x in keys])) + 1

            npc_sheets = generate_npc(level, role, npc_id, npc_sheets, DB)

        return render_template('npcgenerator.j2',
            levels=DB['LEVELS'],
            roles=DB['ROLES'],
            weapons=DB['WEAPON_NAMES'],
            weapons_cat=DB['WEAPONS_CAT'],
            armor=[DB['ARMOR_HELMET'],DB['ARMOR_JACKET'],DB['ARMOR_VEST'],DB['ARMOR_PANTS']],
            bodyparts=DB['BODY_PARTS'],
            wounds=DB['WOUNDS'],
            wounds_max=DB['WOUNDS_MAX'],
            wounds_min=DB['WOUNDS_MIN'],
            npc_sheets=npc_sheets
        )

if __name__ == '__main__':
    app.run( debug = True)