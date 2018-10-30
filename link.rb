require_relative 'post.rb'

class Link < Post

  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts 'Enter URL, plese:'
    @url = STDIN.gets.chomp

    puts 'Enter the name to this link, please:'
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Created at: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"
    return [@url, @text, time_string]
  end

end
