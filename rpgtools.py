from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def start():
    return render_template('home.html')

@app.route('/npcgenerator')
def npcgenerator():
    return render_template('npcgenerator.html')

if __name__ == '__main__':
    app.run( debug = False)