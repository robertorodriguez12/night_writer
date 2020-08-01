require './lib/file_reader'
# require './lib/file_writer'
require 'pry'

class NightWriter

  attr_reader :message, :writer

  def initialize(message, render_to)
    @reader    = FileReader.new
    # @writer    = FileWriter.new
    @message   = @reader.read
    @render_to = render_to
    initial_input
  end

  # def encode_file_to_braille
  #   add method from translator class
  # end

  #def create method in here to eventually translate to english

  def initial_input
    puts "Created '#{@render_to}' containing #{@message.length} characters"
    File.write(@render_to, File.read(ARGV[0]))
  end

end
