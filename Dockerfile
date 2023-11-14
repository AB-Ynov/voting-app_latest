# Utilisez une image Python officielle légère
FROM python:3.8-slim

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier requirements.txt et installez les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiez le reste des fichiers de l'application dans le conteneur
COPY . .

# Variables d'environnement
ENV REDIS=
ENV REDIS_PWD=

# Port d'écoute de l'application
EXPOSE 8080

# Healthcheck pour vérifier si l'application est prête
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/ || exit 1

# Commande pour démarrer l'application
CMD ["python", "app.py"]
