#!/bin/sh
echo "-----------------------------------------"
echo "import Heroku PRD database into local DEV"

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
heroku pg:backups capture --app crowdai-prd
curl -o tmp/crowdai-prd.dmp `heroku pg:backups public-url --app crowdai-prd`
su $SUDO_USER <<'EOF'
set -x
dropdb crowdai_development
createdb crowdai_development
pg_restore --no-acl --no-owner -d crowdai_development tmp/crowdai-prd.dmp
psql -d crowdai_development -c "update ar_internal_metadata set value = 'development' where key = 'environment'; "
#echo "Resetting Participant account passwords"
#echo "Participant.find_each do |p|; p.password = 'password'; p.save; end" | rails c > /dev/null 2>&1
EOF
rm tmp/crowdai-prd.dmp
set +x
echo "DEV database refresh completed"

#echo "Empty crowdai-dev S3 bucket and sync from crowd-prd"
#set -x
#aws s3 rm s3://crowdai-dev --recursive
#aws s3 sync s3://crowdai-prd s3://crowdai-dev --delete
#set +x
#echo ""

echo "------------------------------"
echo "|     REFRESH COMPLETED      |"
echo "------------------------------"
