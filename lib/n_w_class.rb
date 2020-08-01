require './lib/file_reader'
require './lib/translator'
# require './lib/file_writer'
require 'pry'

class NightWriter

  def initialize(message, render_to)
    @reader     = FileReader.new
    @message    = @reader.read
    @translator = Translator.new
    @render_to  = render_to
    initial_input
    translate_to_braille_and_create_new_file
  end

  def translate_to_braille_and_create_new_file
    message = @message.gsub(" ","")
    translated = @translator.translation(message)
    File.write(@render_to, translated)
  end

  #def create method in here to eventually translate to english

  def initial_input
    puts "Created '#{@render_to}' containing #{@message.length} characters"
  end

end
