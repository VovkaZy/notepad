# Class Tweet for working with twitter.com. Used in Notepad console app
# Get user input 'tweet', add time stamp and load data to db
# ver.: 0.9
# Created by v.n.zubarev@gmail.com on 08/11/18

require_relative 'post'
require 'twitter'

class Tweet < Post

  Post.post_types[self.name] = self

  @@CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key = 'your_key'
    config.consumer_secret = 'your_secret'
    config.access_token = 'your_token'
    config.access_token_secret = 'your_token_secret'
  end

  # Ask user for input, get user input and cut it to 140 signs,
  # Send text to twitter with UTF-8 encoding, notify user of successful operation
  def read_from_console
    puts 'Enter new tweet (not more than 140 signs)'
    @text = STDIN.gets.chomp[0..140]
    puts "Sending your new tweet: #{@text.encode('UTF-8')}"
    @@CLIENT.update(@text.encode('UTF-8'))
    puts 'Your tween has been sent'
  end

  def to_strings
    time_string = "Created at: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\n"
    @text.unshift(time_string)
  end

  def to_db_hash
    super.merge(
      'text' => @text # our new tweet
    )
  end

  def load_data(data_hash)
    # first, we use parent method for common fields initialization
    super(data_hash)
    @text = data_hash['text'].split('\n\r')
  end
end
