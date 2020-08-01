require './lib/file_reader'
require './lib/file_writer'
require 'pry'

class NightWriter

  attr_reader :message, :writer

  def initialize(message, render_to)
    @reader    = FileReader.new
    @writer    = FileWriter.new
    @message   = @reader.read
    @render_to = render_to
    initial_input
  end

  def encode_file_to_braille
    @writer.encode_to_braille(@message)
  end


  def initial_input
    puts "Created '#{@render_to}' containing #{@message.length} characters"
  end

end
