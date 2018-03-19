#!/bin/sh

rails db:create
rails db:schema:load
rails db:migrate

rails s -b '0.0.0.0'
