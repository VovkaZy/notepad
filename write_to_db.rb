require_relative 'lib/memo.rb'
require_relative 'lib/task.rb'
require_relative 'lib/link.rb'
require_relative 'lib/post.rb'

Post.check_db!

puts '--------------------------------------------------------------'
puts 'Hi! What type of data you want to add? Choose a number (0 - 2)'
choices = Post.post_types.keys
puts '--------------------------------------------------------------'

choice = -1

until choice.between?(0, choices.size - 1)
  # " 1. Memo" - each on a new line
  puts choices.map.with_index { |type, index| "\t#{index}. #{type}" }.join("\n")

  puts '--------------------------------------------------------------'
  puts 'Your choice number ->'
  choice = STDIN.gets.chomp.to_i
end

# creating new object Post type
entry = Post.create(choices[choice])
entry.read_from_console
id = entry.save_to_db
puts '--------------------------------------------------------------'
puts "Your data saved to db with id: #{id}"
puts '--------------------------------------------------------------'
