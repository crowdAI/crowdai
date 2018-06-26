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
