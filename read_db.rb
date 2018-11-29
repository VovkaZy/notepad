# Class for working with tasks using in Notepad console app
# Get user input, add time stamp for creating and deadline, load data to db
# ver.: 1.0
# Created by v.n.zubarev@gmail.com on 02/11/18

require_relative 'lib/memo'
require_relative 'lib/task'
require_relative 'lib/link'
require_relative 'lib/post'
require_relative 'lib/twitter'
require 'optparse'

Post.check_db!

# here we have all our options
options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read_db.db [options]'

  opt.on('-h', '--help', 'Prints this help') do
    puts opt
    exit
  end

  # Option --type shows post by type
  opt.on('--type POST_TYPE', '-t POST_TYPE', 'what kind of posts to show (default: any)') { |o| options[:type]  = o }
  # Option --id shows records in db by it's id
  opt.on('--id POST_ID', '-i POST_ID', 'if id set, show this post detailed')              { |o| options[:id]    = o }
  # Option --limit tell, how many records from db we want to see on a screen
  opt.on('--limit NUMBER', '-l NUMBER', 'how many last posts to show (default: all)')     { |o| options[:limit] = o }
end.parse!

if options[:id]
  result = Post.find_by_id(options[:id])
  if result.empty?
    puts "This id = #{id} can't be found in database, sorry"
  else
  puts " #{result.class.name}, id = #{options[:id]}"
  puts result.to_strings
  end
else
  result = Post.find_all(options[:type], options[:limit])

  print '| id                 '
  print '| @type              '
  print '| @created_at        '
  print '| @text              '
  print '| @url               '
  print '| @due_date          '
  print '|'

  # Теперь для каждой строки из результатов выведем её в нужном формате
  result.each do |row|
    puts

    row.each do |element|
      element_text = "| #{element.to_s.delete("\n\r")[0..17]}"

      element_text << ' ' * (21 - element_text.size)

      print element_text
    end

    print '|'
  end

  puts
end

