# How to get ready with Pink-Arena ?

## Docker

- Create an *application.yml* file with the right configuration in the [config/](/config) directory and then run :

```
docker-compose up
``` 
       
<br>

## Local

- Install all the dependencies needed by the project :
```
bundle install && yarn install
```

- Install [redis](https://redis.io/) and [postgresql](https://www.postgresql.org/)
> *Don't forget to change your redis URL in [sidekiq.rb](/config/initializers/sidekiq.rb)*

> Verify the information for the database credentials in *[database.yml](/config/database.yml)*
- Reset and migrate the database :

```
bundle exec rails db:reset db:migrate 
```
        
- Create an *application.yml* file with the right configuration in the [config/](/config) directory

<br>

#### For development :
 
- Compile webpacker :
```
bundle exec rails webpacker:compile
```
 
- Launch the server listening on port 3000 :
```
bundle exec rails s -p 3000
```
    
- Launch the webpacker server for development :
```
./bin/webpack-dev-server
```
    
- Launch the sidekiq which manages the different jobs in [/app/jobs](/app/jobs) :
```
bundle exec sidekiq -C config/sidekiq.yml 
```

<br>

#### For production :

- Compile webpacker :
```
bundle exec rails webpacker:compile
```

- Launch the server :
```
bundle exec rails s
```
    
- Launch the sidekiq which manages the different jobs in [/app/jobs](/app/jobs) : 
```
bundle exec sidekiq -C config/sidekiq.yml 
```

- For the **Release** :
```
bundle exec rake db:migrate
```

<br>

## Miscellaneous

If you are facing an error with watchers, try : 
```
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
```