#!/usr/bin/env ruby 

require 'fileutils'

TEST_PATH = 'test'
TEST_FILES = ['test1.txt','test2.txt','test3.txt','test4c.txt','test5.txt','test6.txt']

if ARGV.size < 3
  puts "usage: ./validate IP port1 port2"
  exit
end
ip = ARGV[0]
port1 = ARGV[1].to_i
port2 = ARGV[2].to_i


TEST_FILES.each_with_index do |name,index|
  puts "Test ##{index+1}"
  path = "#{TEST_PATH}/#{name}"
  FileUtils.mkdir_p 'tmp'
  `./client #{ip} #{port1} #{path} > tmp/#{port1}_#{name}.out`
  `./client #{ip} #{port2} #{path} > tmp/#{port2}_#{name}.out`
  `diff tmp/#{port1}_#{name}.out tmp/#{port2}_#{name}.out`
end



