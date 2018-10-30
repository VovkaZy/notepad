require_relative 'post.rb'
require 'date'

class Task < Post

  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'What to do:'
    @text = STDIN.gets.chomp

    puts "Till what date? Example - 23.12.2012"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Created at: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"
    deadline = "Expire date: #{@due_date}"
    return [deadline, @text, time_string]
  end

end
