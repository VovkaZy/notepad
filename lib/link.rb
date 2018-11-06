# Class for working with links using in Notepad console app
# Get user input, add time stamp and load data to db
# ver.: 1.0
# Created by v.n.zubarev@gmail.com on 02/11/18

class Link < Post
  Post.post_types[self.name] = self

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
    [@url, @text, time_string]
  end

  def to_db_hash
    super.merge(
      'text' => @text,
      'url' => @url
    )
  end

  def load_data(data_hash)
    super(data_hash) # first use parent method for common fields initialization
    @url = data_hash['url']
    @text = data_hash['text']
  end
end
