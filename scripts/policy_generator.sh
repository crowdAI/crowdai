#!/bin/sh

#mkdir tmp/policies/
dir='app/policies/'
for i in `ls app/controllers/*s_controller.rb | xargs -n 1 basename`
do 
   name=${i%s_controller.rb}
   policyfile="${dir}${name}_policy.rb"
   if [ ! -e "$policyfile" ] ; then
      echo "class ${name}Policy < ApplicationPolicy  end " > $policyfile
   fi
done
