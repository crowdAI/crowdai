#!/bin/sh
psql -c 'create database <DB_NAME>;' -U postgres
psql -U postgres -q -d <DB_NAME> -f db/structure.sql
