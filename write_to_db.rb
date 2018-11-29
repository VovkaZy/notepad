require_relative 'lib/memo'
require_relative 'lib/task'
require_relative 'lib/link'
require_relative 'lib/post'
require_relative 'lib/twitter'

Post.check_db!

puts '--------------------------------------------------------------'
puts 'Hi! What type of data you want to add? Choose a number (0 - 3)'
choices = Post.post_types.keys
puts '--------------------------------------------------------------'

choice = -1

until choice.between?(0, choices.size - 1)
  # " 0. Memo" - each on a new line
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
