# Class Task for working with tasks. Used in Notepad console app
# Get user input, add time stamp for creating and deadline date, load data to db
# ver.: 0.9
# Created by v.n.zubarev@gmail.com on 02/11/18

require_relative 'post'
require 'date'

class Task < Post
  Post.post_types[self.name] = self

  def initialize
    super
    @due_date = Time.now
  end

  # Ask user for input, save it to the variables
  def read_from_console
    puts 'What to do:'
    @text = STDIN.gets.chomp

    puts 'Till what date? Example - 23.12.2012'
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Created at: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}"
    deadline = "Expire date: #{@due_date}"
    [deadline, @text, time_string]
  end

  def to_db_hash
    super.merge(
      'text' => @text,
      'due_date' => @due_date.to_s
    )
  end

  def load_data(data_hash)
    # first we use parent method for common fields initialization
    super(data_hash)
    @due_date = Date.parse(data_hash['due_date'])
    @text = data_hash['text']
  end
end
