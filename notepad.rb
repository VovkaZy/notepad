require_relative 'memo.rb'
require_relative 'task.rb'
require_relative 'link.rb'

puts 'Hi! What type of data you want to add?'

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choice.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = STDIN.gets.chomp.to_i
end

# creating new object Post type
entry = Post.create(choice)

entry.read_from_console

entry.save_in_file

puts 'Your data saved to file'
