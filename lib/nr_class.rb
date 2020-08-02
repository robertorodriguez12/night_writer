require './lib/file_reader'
require './lib/translate_to_english'
require 'pry'

class NightReader

  def initialize(message, render_to)
    @reader     = FileReader.new
    @message    = @reader.read
    @translator = BrailleToEnglish.new
    @render_to  = render_to
    confirmation_output
    translate_to_english_and_create_new_file
  end

  def translate_to_english_and_create_new_file
    message = @message
    translated = @translator.translation(message)
    File.write(@render_to, translated)
  end

  def confirmation_output
    puts "Created '#{@render_to}' containing #{@message.length} characters"
  end

end
