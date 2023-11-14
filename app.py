from flask import Flask
import os

app = Flask(__name__)

# Récupérez la variable d'environnement REDIS pour le lien vers le serveur Redis
redis_host = os.getenv('REDIS', 'localhost')
redis_pwd = os.getenv('REDIS_PWD', '')

@app.route('/')
def index():
    return f'Bonjour, c’est l’application voting app! Hôte Redis : {redis_host}, Mot de passe Redis : {redis_pwd}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)