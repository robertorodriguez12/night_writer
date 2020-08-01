require './lib/file_reader'
require 'pry'

class NightWriter

  def initialize(message, render_to)
    @reader    = FileReader.new
    # binding.pry
    @message   = @reader.read
    @render_to = render_to
    initial_input
  end

  # def encode_file_to_braille
  #   # I wouldn't worry about testing this method
  #   # unless you get everything else done
  #   plain = reader.read
  #   braille = encode_to_braille(plain)
  # end

  # def encode_to_braille(input)
  #   # you've taken in an INPUT string
  #   # do the magic
  #   # send out an OUTPUT string
  # end

  def initial_input
    puts "Created '#{@render_to}' containing #{@message.length} characters"
  end

end