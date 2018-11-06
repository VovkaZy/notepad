# Class for working with tasks using in Notepad console app
# Get user input, add time stamp for creating and deadline, load data to db
# ver.: 1.0
# Created by v.n.zubarev@gmail.com on 02/11/18

require_relative 'lib/post.rb'
require_relative 'lib/memo.rb'
require_relative 'lib/task.rb'
require_relative 'lib/link.rb'

Post.check_db!

require 'optparse'

# here we have all our options
options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.db [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'what kind of posts to show ' \
         '(default: any)') { |o| options[:type] = o }

  opt.on('--id POST_ID', 'if id set,' \
         'show this post detailed') { |o| options[:id] = o }

  opt.on('--limit NUMBER', 'how many last posts to show' \
         '(default: all)') { |o| options[:limit] = o }
end.parse!

if options[:id]
  result = Post.find_by_id(options[:id])

  puts "A record #{result.class.name}, id = #{options[:id]}"
  puts result.to_strings
else
  result = Post.find_all(options[:type], options[:limit])

  print '| id                 '
  print '| @type              '
  print '| @created_at        '
  print '| @text              '
  print '| @url               '
  print '| @due_date          '
  print '|'

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
