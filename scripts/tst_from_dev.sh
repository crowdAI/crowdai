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

su $SUDO_USER <<'EOF'
set -x
dropdb crowdai_test
createdb crowdai_test
pg_dump crowdai_development | psql crowdai_test
echo "Test database cloned from development"
set +x
EOF
