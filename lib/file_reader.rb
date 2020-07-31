require 'pry'
class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end



# class FileReader
#   def read_file(message)
#     reader = File.open(message)
#     @file_content = reader.read.chomp
#   end
# end
