import random
from django.shortcuts import render
from .utils.db import get_globals
from .utils.npc_generate import generate_npc
from .utils.npc_update import update_npcs
from .utils.npc_db import load_npc, save_npc

# Create your views here.
def index(request):
    return render(request, 'home.j2')

def npcgenerator(request):

    data = get_globals()

    if request.method == 'GET':
        return render(request, 'npcgenerator.j2', {'levels': data['LEVELS'], 'races': data['RACES'], 'roles': data['ROLES'], 'npcs': data['NPCS']})

    if request.method == 'POST':

        keys = [x.split('_') for x in request.POST.keys()]
        npc_sheets = update_npcs(keys, request.POST, data)

        # Get new npc_id
        npc_id = int(max([x[0] for x in keys if len(x) != 1])) + 1

        if request.POST['0_submit'].isnumeric():

            if request.user.is_authenticated:
                save_npc(npc_sheets[int(request.POST['0_submit'])])

        if request.POST['0_submit'] == 'load':

            npc_sheets = load_npc(request.POST['0_npc'], npc_id, npc_sheets, data)

        if request.POST['0_submit'] == 'generate':
            # Get level
            level = request.POST['0_level']
            if level == 'Random':
                level = random.choice(data['LEVELS'])
            else:
                level = data['LEVELS'].get(id=level)

            # Get Race
            race = request.POST['0_race']
            if race == 'Random':
                race = random.choice(data['RACES'])
            else:
                race = data['RACES'].get(id=race)

            # Get role
            role = request.POST['0_role']
            if role == 'Random':
                role = random.choice(data['ROLES'])
            else:
                role = data['ROLES'].get(id=role)

            npc_sheets = generate_npc(level, role, race, npc_id, npc_sheets, data)

        return render(request, 'npcgenerator.j2', {
            'levels': data['LEVELS'],
            'races': data['RACES'],
            'roles': data['ROLES'],
            'npcs': data['NPCS'],
            'skills': data['SKILLS'],
            'weapons': data['WEAPONS'],
            'tinfoilware': data['TINFOILWARE'],
            'armor': data['ARMOR'],
            'bodyparts': data['BODY_PARTS'],
            'wounds': data['WOUNDS'],
            'wounds_max': data['WOUNDS_MAX'],
            'wounds_min': data['WOUNDS_MIN'],
            'npc_sheets': npc_sheets
        })
