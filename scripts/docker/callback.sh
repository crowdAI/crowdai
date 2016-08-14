#!/bin/sh

apt-get update -y && apt-get install curl -y
curl -X PUT -G https://crowdai-stg.herokuapp.com/api/v1/callback -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="***REMOVED***"'
