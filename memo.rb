require_relative 'post.rb'

class Memo < Post

  def read_from_console
    puts 'New memo (I will save all text till \'close\' word :'

    @text = []
    line = nil

    while line != 'close'
      line = STDIN.gets.chomp
      @text << line
    end
    # cut last word 'close' in array @text
    @text.pop
  end

  def to_strings
    time_string = "Created at: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"
    return @text.unshift(time_string)
  end
end
