require_relative 'english_keys'
require 'pry'

class BrailleToEnglish
  include EnglishKeys

  def translation(message)

  end

  def split_braille(message)
    length = message.length / 3
    message.scan(/.{1,#{length}}/)
  end

  def get_first_braille_element(input)
    input.fetch(0).scan(/.{1,2}/)
  end

  def get_second_braille_element(input)
    input.fetch(1).scan(/.{1,2}/)
  end

end
