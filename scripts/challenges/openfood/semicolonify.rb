#!/usr/bin/env ruby
puts File.read(ARGV[0]).split("\n").delete_if{|line| line =~ /^\s*#/}.compact.join(';')
