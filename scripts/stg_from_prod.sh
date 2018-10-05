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

set -x
heroku ps:scale worker=0 --app crowdai-stg
heroku pg:copy crowdai-prd::DATABASE_URL crowdai-stg::DATABASE_URL --app crowdai-stg --confirm crowdai-stg
heroku ps:scale worker=1 --app crowdai-stg
set +x

echo "STG database refresh completed"
echo "------------------------------"
echo "|     REFRESH COMPLETED      |"
echo "------------------------------"
