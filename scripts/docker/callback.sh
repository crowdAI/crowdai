#!/bin/sh
curl -X PUT -G https://crowdai-stg.herokuapp.com/api/v1/docker_callbacks/create -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="***REMOVED***"'
