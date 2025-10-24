#!/bin/bash

# Script de déploiement DriveOps sur GitHub
# Usage: ./deploy.sh

echo "🚀 DriveOps - Déploiement GitHub"
echo "================================="
echo ""

# Vérifier si Git est installé
if ! command -v git &> /dev/null; then
    echo "❌ Git n'est pas installé. Installez-le d'abord :"
    echo "   https://git-scm.com/downloads"
    exit 1
fi

# Demander l'URL du repository
echo "📝 Entrez l'URL de votre repository GitHub :"
echo "   Exemple : https://github.com/agitech-be/driveops-landing.git"
read -p "URL : " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ URL vide. Arrêt du script."
    exit 1
fi

# Créer un dossier temporaire
TEMP_DIR="driveops-deploy-temp"
rm -rf "$TEMP_DIR"
mkdir "$TEMP_DIR"

echo ""
echo "📦 Copie des fichiers..."
cp index.html "$TEMP_DIR/"
cp README.md "$TEMP_DIR/"
cp .gitignore "$TEMP_DIR/"
cp DEPLOYMENT_GUIDE.md "$TEMP_DIR/"

cd "$TEMP_DIR"

# Initialiser Git
echo ""
echo "🔧 Initialisation Git..."
git init
git add .
git commit -m "Initial commit - DriveOps landing page"

# Ajouter le remote
echo ""
echo "🔗 Connexion au repository GitHub..."
git branch -M main
git remote add origin "$REPO_URL"

# Pousser sur GitHub
echo ""
echo "⬆️ Envoi vers GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Déploiement réussi !"
    echo ""
    echo "📋 Prochaines étapes :"
    echo "1. Allez sur GitHub : ${REPO_URL%.git}"
    echo "2. Settings → Pages"
    echo "3. Source : 'Deploy from a branch'"
    echo "4. Branch : 'main' / Folder : '/ (root)'"
    echo "5. Cliquez 'Save'"
    echo ""
    echo "⏱️ Votre site sera disponible dans 1-2 minutes à :"
    
    # Extraire le username et repo name
    REPO_PATH=$(echo "$REPO_URL" | sed 's/https:\/\/github.com\///' | sed 's/.git$//')
    USERNAME=$(echo "$REPO_PATH" | cut -d'/' -f1)
    REPONAME=$(echo "$REPO_PATH" | cut -d'/' -f2)
    
    echo "   https://${USERNAME}.github.io/${REPONAME}/"
    echo ""
else
    echo ""
    echo "❌ Erreur lors du push vers GitHub."
    echo ""
    echo "💡 Vérifiez que :"
    echo "1. Vous êtes connecté à GitHub (git config --global user.name / user.email)"
    echo "2. Le repository existe sur GitHub"
    echo "3. Vous avez les droits d'accès"
    echo ""
    echo "📚 Pour configurer Git :"
    echo "   git config --global user.name 'Votre Nom'"
    echo "   git config --global user.email 'votre@email.com'"
fi

# Nettoyage
cd ..
rm -rf "$TEMP_DIR"
