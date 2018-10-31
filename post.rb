require 'sqlite3'

class Post
  # static class method
  def self.post_types
    [Memo, Link, Task]
  end

  # static child ancestors creator
  def self.create(type_index)
    post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console; end

  def to_strings; end

  def save_in_file
    file = File.new(file_path, 'w:UTF-8')

    # for item in to_strings
    to_strings.each { |item| file.puts(item) }
    file.close
  end

  def file_path
    n = self.class.name

    current_path = File.dirname(__FILE__)

    file_name = @created_at.strftime(n.to_s + '/' + "#{n}_%Y-%m-%d_%H-%M-%S.txt")

    current_path + '/' + file_name
  end
end
