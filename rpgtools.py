import sqlite3
from flask import Flask, render_template, g, json

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

def to_table(rowlist, rows, cols):
    ret = []
    for i in range(rows):
        sub = []
        for j in range(cols):
            item = list(filter(lambda x: x['idx'] == i+1 and x['idy'] == j+1, rowlist))
            if item == []:
                sub.append(None)
            else:
                sub.append(item[0])
        ret.append(sub)
    return ret

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

@app.route('/')
def start():
    return render_template('home.j2')

@app.route('/goongenerator')
def npcgenerator():
    stats = query_db('select * from stats where type = "primary" order by idx')
    comp_stats = query_db('select * from stats where type != "primary" or type is null order by idx, idy')
    comp_table = query_db('select max(idx) r, max(idy) c from stats where type != "primary" or type is null')
    body_types = query_db('select * from body_types')
    body_parts = query_db('select * from body_parts order by idx')
    wounds = query_db('select * from wounds order by stun_save_mod desc')
    return render_template('goongenerator.j2', stats=stats, comp_stats=to_table(comp_stats, comp_table[0]['r'], comp_table[0]['c']), body_types=body_types, body_parts=body_parts, wounds=wounds)

if __name__ == '__main__':
    app.run( debug = True)