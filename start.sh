#!/bin/bash
set -eu

export DATABASE_URL=${CLOUDRON_POSTGRESQL_URL}
export PORT=3000

cd /app

echo "Mise à jour de la base de données..."
npm run db-update

echo "Démarrage de l'application..."
exec gosu cloudron:cloudron npm start
