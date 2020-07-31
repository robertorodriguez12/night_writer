class FileReader

  def read
    filename = ARGV[0]
    file.read(filename)
  end
end 
