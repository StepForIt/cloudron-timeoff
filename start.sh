#!/bin/bash
set -eu

export DATABASE_URL=${CLOUDRON_POSTGRESQL_URL}
export PORT=3000

cd /app/code

echo "Démarrage de l'application..."
exec gosu cloudron:cloudron npm start
