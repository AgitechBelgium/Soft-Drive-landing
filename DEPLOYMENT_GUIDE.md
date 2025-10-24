# 🚀 Guide de Déploiement DriveOps Landing Page

## Méthode 1 : GitHub Pages (Recommandée - Gratuit)

### Étape 1 : Créer le repository GitHub

1. **Connectez-vous à GitHub** : https://github.com
2. **Créez un nouveau repository** :
   - Cliquez sur le bouton vert "New" ou "+"
   - Nom : `driveops-landing` (ou tout autre nom)
   - Description : "Landing page pour DriveOps - Solution de gestion auto-école"
   - Visibilité : Public (pour GitHub Pages gratuit)
   - ✅ Cochez "Add a README file"
   - Cliquez "Create repository"

### Étape 2 : Uploader les fichiers

**Option A : Via l'interface web (plus simple)**

1. Dans votre repository, cliquez "Add file" → "Upload files"
2. Glissez-déposez ces fichiers :
   - `index.html`
   - `README.md`
   - `.gitignore`
3. Ajoutez un message de commit : "Initial commit - DriveOps landing page"
4. Cliquez "Commit changes"

**Option B : Via Git (ligne de commande)**

```bash
# Clonez le repository
git clone https://github.com/VOTRE-USERNAME/driveops-landing.git
cd driveops-landing

# Copiez vos fichiers dans ce dossier
# (index.html, README.md, .gitignore)

# Ajoutez les fichiers
git add .

# Commitez
git commit -m "Initial commit - DriveOps landing page"

# Poussez sur GitHub
git push origin main
```

### Étape 3 : Activer GitHub Pages

1. Dans votre repository, allez dans **Settings** (⚙️ en haut à droite)
2. Dans le menu de gauche, cliquez sur **Pages**
3. Dans "Build and deployment" :
   - **Source** : Deploy from a branch
   - **Branch** : `main` (ou `master`)
   - **Folder** : `/ (root)`
4. Cliquez **Save**
5. ✅ Attendez 1-2 minutes

Votre site sera disponible à : 
```
https://VOTRE-USERNAME.github.io/driveops-landing/
```

---

## Méthode 2 : Domaine personnalisé (driveops.agitech.io)

### Étape 1 : Configurer GitHub Pages (suivez Méthode 1 d'abord)

### Étape 2 : Ajouter un fichier CNAME

1. Dans votre repository GitHub, créez un fichier `CNAME`
2. Contenu du fichier (une seule ligne) :
   ```
   driveops.agitech.io
   ```
3. Commitez le fichier

### Étape 3 : Configurer les DNS

Chez votre registrar de domaine (ex: OVH, Cloudflare, etc.) :

**Pour un sous-domaine (driveops.agitech.io) :**

```
Type: CNAME
Name: driveops
Value: VOTRE-USERNAME.github.io
TTL: 3600
```

**Pour le domaine principal (driveops.io) :**

```
Type: A
Name: @
Value: 185.199.108.153
TTL: 3600

Type: A
Name: @
Value: 185.199.109.153
TTL: 3600

Type: A
Name: @
Value: 185.199.110.153
TTL: 3600

Type: A
Name: @
Value: 185.199.111.153
TTL: 3600
```

### Étape 4 : Activer HTTPS

1. Retournez dans GitHub **Settings** → **Pages**
2. Cochez ✅ **Enforce HTTPS**
3. Attendez quelques minutes que le certificat SSL soit généré

---

## Méthode 3 : Netlify (Alternative gratuite)

### Avantages de Netlify
- ✅ Déploiement automatique depuis GitHub
- ✅ HTTPS gratuit
- ✅ CDN mondial
- ✅ Formulaires de contact intégrés
- ✅ Redirections et headers personnalisés

### Étapes

1. **Créez un compte** : https://app.netlify.com/signup
2. **Nouveau site** :
   - Cliquez "Add new site" → "Import an existing project"
   - Connectez votre compte GitHub
   - Sélectionnez le repository `driveops-landing`
3. **Configuration** :
   - Build command : (laissez vide)
   - Publish directory : (laissez vide ou mettez `/`)
   - Cliquez "Deploy site"
4. **Domaine personnalisé** :
   - Site settings → Domain management
   - Add custom domain : `driveops.agitech.io`
   - Suivez les instructions DNS

Votre site sera disponible à :
```
https://random-name.netlify.app
```
(vous pouvez changer le nom)

---

## Méthode 4 : Vercel (Alternative gratuite)

### Étapes

1. **Créez un compte** : https://vercel.com/signup
2. **Nouveau projet** :
   - Cliquez "Add New..." → "Project"
   - Importez depuis GitHub
   - Sélectionnez `driveops-landing`
3. **Déploiement** :
   - Framework Preset : Other
   - Cliquez "Deploy"

Votre site sera disponible à :
```
https://driveops-landing.vercel.app
```

---

## 🔧 Maintenance et mises à jour

### Mettre à jour le contenu

1. Éditez `index.html` sur GitHub (ou en local)
2. Commitez les changements
3. GitHub Pages / Netlify / Vercel redéploiera automatiquement

### Tester en local

```bash
# Option 1 : Python
python3 -m http.server 8000

# Option 2 : Node.js
npx http-server

# Ouvrez : http://localhost:8000
```

---

## 📊 Analytics (Optionnel)

### Ajouter Google Analytics

Avant la balise `</head>` dans `index.html` :

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

---

## 🆘 Dépannage

### Le site ne s'affiche pas
- ✅ Vérifiez que GitHub Pages est activé
- ✅ Attendez 2-5 minutes après l'activation
- ✅ Vérifiez que le fichier s'appelle bien `index.html`
- ✅ Regardez les logs dans Actions (onglet GitHub)

### Le domaine personnalisé ne fonctionne pas
- ✅ Vérifiez la propagation DNS : https://dnschecker.org
- ✅ Attendez jusqu'à 48h pour la propagation complète
- ✅ Vérifiez le fichier CNAME
- ✅ Désactivez/réactivez le domaine personnalisé dans Settings

### Les polices ne se chargent pas
- ✅ Vérifiez votre connexion Internet
- ✅ Google Fonts pourrait être bloqué par un pare-feu
- ✅ Les polices sont chargées depuis CDN externe

---

## 📞 Support

Pour toute question :
- 📧 diego.riera@agitech.io
- 🌐 https://agitech.io

---

**Bonne chance avec le déploiement ! 🚀**
