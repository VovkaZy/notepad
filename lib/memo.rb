# Class for working with memo using in Notepad console app
# Get user input till work 'close', add time stamp and load data to db
# ver.: 1.0
# Created by v.n.zubarev@gmail.com on 02/11/18

require_relative 'post'

class Memo < Post
  Post.post_types[self.name] = self

  # Ask user for input, save it to array till the word 'close'
  def read_from_console
    puts 'New memo (I will save all text till \'close\' word :'
    @text = []
    line = nil
    until line == 'close'
      line = STDIN.gets.chomp
      @text << line
    end
    # cut last word 'close' in array @text
    @text.pop
  end

  def to_strings
    time_string = "Created at: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\n"
    @text.unshift(time_string)
  end

  def to_db_hash
    super.merge(
      'text' => @text.join('\n\r') # strings array in 1 line
    )
  end

  def load_data(data_hash)
    # first we use parent method for common fields initialization
    super(data_hash)
    @text = data_hash['text'].split('\n\r')
  end
end
