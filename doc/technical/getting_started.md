## Getting Started

[Set up your workstation for Rails development](https://gorails.com/setup/osx/10.13-high-sierra)

In the terminal

```bash
git clone git@github.com:crowdAI/crowdai.git
cd crowdai
bundle install
yarn install
rails db:reset
foreman start -f Procfile.dev
```

Then visit http://localhost:3000 in your browser
You can log on with admin@example.com / password

(other accounts are in db/seeds.rb)


### Alternative database creation method

The database can also be created by

```
rails db:drop
rails db:create
rails db:migrate
```

Then to add seeds

```
rails db:seed
```
