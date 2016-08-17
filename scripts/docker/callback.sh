#!/bin/sh
hostname="`eval cat /etc/hostname`"
echo $hostname
set -x
curl -X POST -G https://crowdai-stg.herokuapp.com/api/v1/docker_callbacks -d "container=$hostname" -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="***REMOVED***"'
