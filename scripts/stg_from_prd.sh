#!/bin/sh
echo "-----------------------------------------"
echo "import Heroku PRD database into STG"

if [[ $UID != 0 ]]; then
  echo "Please run this script with sudo:"
  echo "sudo bash $0 $*"
  exit 1
fi

if [[ ${PWD##*/} != 'crowdai' ]]; then
  echo "Please run this script from the crowdAI root directory"
  exit 1
fi

echo "backup PRD to local"
set -x
heroku pg:backups capture --app crowdai-prd
curl -o tmp/crowdai-prd.dmp `heroku pg:backups public-url --app crowdai-prd`
set +x

echo "starting refresh of STG from PRD"
set -x
heroku ps:scale worker=0 --app crowdai-stg
heroku pg:copy crowdai-prd::HEROKU_POSTGRESQL_RED_URL HEROKU_POSTGRESQL_RED_URL --app crowdai-stg --confirm crowdai-stg
heroku ps:scale worker=1 --app crowdai-stg
echo "Resetting Participant account passwords"
echo "Participant.find_each do |p|; p.password = 'password'; p.save; end; exit" | heroku run rails c --app crowdai-stg  > /dev/null 2>&1
set +x


echo "STG database refresh completed"
echo "------------------------------"
