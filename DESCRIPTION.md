# TimeOff Management

Une application de gestion des congés simple et efficace, déployable sur Cloudron.

## Caractéristiques

- Gestion complète des demandes de congés
- Interface utilisateur intuitive
- Base de données PostgreSQL pour un stockage fiable
- Stockage local pour les fichiers et documents
- Déploiement facile via Cloudron

## Prérequis

- Une instance Cloudron
- PostgreSQL (fourni automatiquement via les addons Cloudron)
- Stockage local (fourni automatiquement via les addons Cloudron)

## Développement Local

L'application peut être développée localement en utilisant Docker Compose :

```bash
task compose:build    # Construction des services
task compose:up       # Démarrage des services
task compose:logs     # Affichage des logs
task compose:down     # Arrêt des services
```

Ou simplement :

```bash
task dev              # Démarre l'environnement de développement
task dev-down         # Arrête l'environnement de développement
```

## Installation sur Cloudron

L'application peut être installée directement depuis le Cloudron App Store ou via les commandes Task :

```bash
task cloudron:login    # Connexion à Cloudron
task cloudron:build    # Construction du package
task cloudron:install  # Installation de l'application
```

## Mise à jour

Pour mettre à jour l'application :

```bash
task cloudron:update
```

## Support

Pour consulter les logs de l'application :

```bash
task cloudron:logs
```