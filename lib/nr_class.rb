require './lib/file_reader'
require './lib/translator'
require 'pry'

class NightReader

  def initialize(message, render_to)
    @reader     = FileReader.new
    @message    = @reader.read
    @translator = Translator.new
    @render_to  = render_to
    confirmation_output
  end



  def confirmation_output
    puts "Created '#{@render_to}' containing #{@message.length} characters"
  end

end
