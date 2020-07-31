class FileReader

  def read_file
    reader = File.open(ARGV[0])
    # binding.pry
    @file_content = reader.read.chomp
    reader.close
  end
end
