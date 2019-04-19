require 'colorize'
require 'date'

def dash_seperator
  '-' * 50
end

def get_date
  Date.today.to_s
end

def save_last_updated
  File.write("last_updated.txt", get_date)
end

def not_opened_today?
  !File.exist?("last_updated.txt") || File.read("last_updated.txt") != get_date
end

if ARGV.empty?
  puts "Ooops you forgot to give your victory"
  exit -1
end

if not_opened_today?
  puts "Hey, awesome for checking in!".green
  puts
end 

open('VICTORIES.md', 'a') do |f|
  if not_opened_today?
    f.puts dash_seperator
    f.puts "## #{get_date}"
    f.puts
  end

  save_last_updated

  response = ARGV.join(" ")
  f.puts "- #{response}"
  f.puts 
end

# Cleanup code as needed, but honestly I really don't think much is other than 
# ego reasons.
#
# Other thoughts
# 1. How much user input/output do we need here?
