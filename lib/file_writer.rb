class FileWriter

  def initialzie
    @translated_message = ARGV[1]
    @char_count         = 0
  end

  def write_braille_message
    if @translated_message == "braille.txt"
      @char_count = File.write

  end

end
