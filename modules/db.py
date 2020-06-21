import sqlite3
from flask import g

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

def get_globals():
    items = {}

    items['LEVELS'] = query_db('select * from levels')
    items['ROLES'] = query_db('select * from roles')

    items['STATS'] = query_db('select * from stats where type in ("primary","secondary") order by idx')

    items['WEAPONS'] = query_db('select * from weapons')

    items['WEAPON_NAMES'] = query_db('''
        select wcs.idx, wcs.cat, w.name
        from weapons w
        join weapon_types wt on wt.id = w.type
        left join weapon_subtypes ws on ws.id = w.subtype
        join weapon_cat_sort wcs on wcs.cat = coalesce(ws.name || ' ', '') || wt.name || 's'
        order by wcs.idx
    ''')

    items['WEAPONS_CAT'] = query_db('select * from weapon_cat_sort order by idx')

    items['ARMOR_HELMET'] = query_db('select * from armor where type="Helmet" order by sp_head,sp_torso,sp_larm,sp_lleg')
    items['ARMOR_JACKET'] = query_db('select * from armor where type="Jacket" order by sp_head,sp_torso,sp_larm,sp_lleg')
    items['ARMOR_VEST'] = query_db('select * from armor where type="Vest" order by sp_head,sp_torso,sp_larm,sp_lleg')
    items['ARMOR_PANTS'] = query_db('select * from armor where type="Pants" order by sp_head,sp_torso,sp_larm,sp_lleg')

    items['BODYPARTS'] = query_db('select * from body_parts order by idx')

    # Wounds
    items['WOUNDS'] = query_db('select * from wounds order by stun_save_mod desc')
    items['WOUNDS_MAX'] = max([x[2] for x in items['WOUNDS']])
    items['WOUNDS_MIN'] = min([x[2] for x in items['WOUNDS']])

    return items