class Post


  # static class method
  def self.post_types
    [Memo, Link, Task]
  end

  # static child ancestors creator
  def self.create(type_index)
    return post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console
  end

  def to_strings
  end

  def save_in_file
    file = File.new(file_path, 'w:UTF-8')

    for item in to_strings
      file.puts(item)
    end
    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)

    file_name = @created_at.strftime("#{self.class.name}" + "/" + "#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    current_path + "/" + file_name
  end
end
