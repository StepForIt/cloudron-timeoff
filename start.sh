#!/bin/sh
set -eu

cd /app/code

mkdir -p /app/data/config

# Création du fichier db. à partir des variables d'environnement
cat > /app/data/config/db.json <<EOF
{
  "test": {
    "username": "${CLOUDRON_POSTGRESQL_USERNAME}",
    "password": "${CLOUDRON_POSTGRESQL_PASSWORD}",
    "database": "${CLOUDRON_POSTGRESQL_DATABASE}",
    "host": "${CLOUDRON_POSTGRESQL_HOST}",
    "port": ${CLOUDRON_POSTGRESQL_PORT},
    "dialect": "postgres"
  },
  "production": {
    "dialect": "sqlite",
    "storage": "/app/data/db.production.sqlite",
    "logging": false 
  },
  "development": {
    "dialect": "sqlite",
    "storage": "/app/data/db.development.sqlite",
    "logging": false 
  }
}
EOF

# S'assurer que le fichier appartient à l'utilisateur cloudron
chown cloudron:cloudron /app/data/config/db.json

# Création du fichier app.json à partir des variables d'environnement
cat > /app/data/config/app.json <<EOF
{  "allow_create_new_accounts" : true,
  "send_emails"              : false,
  "application_sender_email" : "email@test.com",
  "email_transporter" : {
    "host" : "${CLOUDRON_MAIL_SMTP_SERVER}",
    "port" : ${CLOUDRON_MAIL_SMTP_PORT},
    "auth" : {
      "user" : "${CLOUDRON_MAIL_SMTP_USERNAME}",
      "pass" : "${CLOUDRON_MAIL_SMTP_PASSWORD}"
    }
  },
  "sessionStore": {
    "useRedis": false,
    "redisConnectionConfiguration": {
      "host": "${CLOUDRON_REDIS_HOST}",
      "port": ${CLOUDRON_REDIS_PORT},
      "password": "${CLOUDRON_REDIS_PASSWORD}"
    }
  },
  "ga_analytics_on" : false,
  "crypto_secret" : "!2~HswpPPLa22+=±§sdq qwe,appp qwwokDF_",
  "application_domain" : "${CLOUDRON_APP_ORIGIN}",
  "promotion_website_domain" : "${CLOUDRON_APP_ORIGIN}",
  "locale_code_for_sorting": "en",
  "force_to_explicitly_select_type_when_requesting_new_leave": false
}
EOF

# S'assurer que le fichier appartient à l'utilisateur cloudron
chown cloudron:cloudron /app/data/config/app.json

chown cloudron:cloudron /app/data/config/db.json

mkdir -p /app/data/bin
cp /app/code/bin/wwww.backup /app/data/bin/wwww

chown -R cloudron:cloudron /app/data

echo "Démarrage de l'application..."

NODE_ENV=development exec gosu cloudron:cloudron npm start
