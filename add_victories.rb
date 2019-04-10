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

if not_opened_today?
  puts "Hey, awesome for checking in!".green
  puts

  puts "Too many or too little is perfectly okay too" 
  puts "It's okay to split one thing into multiple to feel better too :)"
  puts
  puts "List out things, and add on explainations too. Cheesy like a pizza."
  puts
  puts "Mundane or huge, it's all good"
end 

puts "One a line. Enter blank or Control-C when done".green
puts dash_seperator

open('VICTORIES.md', 'a') do |f|
  if not_opened_today?
    f.puts dash_seperator
    f.puts "## #{get_date}"
    f.puts
  end

  save_last_updated

  counter = 1
  while true
    puts "#{counter.to_s.green}"
    response = gets
    break if response == "\n"

    f.puts "- #{response}"
    
    f.puts 
    puts
    counter += 1
  end
end

wholesome_responses = ["That's great", "One more step forward!", "Keep going", "Gambate!", "Everything you write here is progress", "Success is a million little things at once"]

puts dash_seperator
puts wholesome_responses.sample.green

# Cleanup code as needed, but honestly I really don't think much is other than 
# ego reasons.
#
# Other thoughts
# 1. Add to start of file or end of file
# 2. Add more wholesomeness
# 3. Formatting can be imperfect but can we make it better
