require 'pry'
class FileReader

  def read_file(message)
    reader = File.open(message)
    @file_content = reader.read.chomp
  end
end
