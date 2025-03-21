There is file named config/db.json

You need to edit it to configure the database.

default config:
```json
{
    "development": {
      "dialect": "sqlite",
      "storage": "./db.development.sqlite",
      "logging": false 
    },
    "test": {
      "username": "root",
      "password": null,
      "database": "database_test",
      "host": "127.0.0.1",
      "dialect": "mysql"
    },
    "production": {
      "username": "root",
      "password": null,
      "database": "database_production",
      "host": "127.0.0.1",
      "dialect": "mysql"
    }
  }
```

There is also a file named config/app.json

```json
{
  "allow_create_new_accounts" : true,
  "send_emails"              : false,
  "application_sender_email" : "email@test.com",
  "email_transporter" : {
    "host" : "localhost",
    "port" : 25,
    "auth" : {
      "user" : "user",
      "pass" : "pass"
    }
  },
  "sessionStore": {
    "useRedis": false,
    "redisConnectionConfiguration": {
      "host": "localhost",
      "port": 6379
    }
  },
  "ga_analytics_on" : false,
  "crypto_secret" : "!2~`HswpPPLa22+=±§sdq qwe,appp qwwokDF_",
  "application_domain" : "http://app.timeoff.management",
  "promotion_website_domain" : "http://timeoff.management",
  "locale_code_for_sorting": "en",
  "force_to_explicitly_select_type_when_requesting_new_leave": false
}
```

## How to use Redis as storage for Sessions
By default application uses its database as a storage for session data (Sessions table).

It is possible to use different storage mechanism for Sessions data: Redis.

### Steps
- Ensure the application's source is at least 1.4.0
- Stop the application
- Open config/app.json for editing
- Update sessionStore.useRedis section to be true
- Update sessionStore.redisConnectionConfiguration's host and port pointing to corresponding instance of Redis
- Save the configuration file
- Restart the application
