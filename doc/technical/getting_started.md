## Getting Started

[Set up your workstation for Rails development](https://gorails.com/setup/osx/10.13-high-sierra)

In the terminal

```bash
git clone git@github.com:crowdAI/crowdai.git
cd crowdai
bundle install
rake db:create
rake db:migrate
rake db:seed
foreman start -f Procfile.dev
```

Then visit http://localhost:3000 in your browser
You can log on with admin@example.com / password

(other accounts are in db/seeds.rb)


## Doorkeeper views

A quick way to develop against custom Doorkeeper views is to use this url

```
localhost:3000/oauth/authorize?client_id=39e844f931486f85ee5126fae22e1cc47ea72b1130aacaf1a5f5ac5ebbc80499&redirect_uri=https%3A%2F%2Fgitlab.crowdai.org%2Fusers%2Fauth%2Foauth2_generic%2Fcallback&response_type=code&state=db3eaa9d07f634649105862f5f3c12444583056869f781c9
```
