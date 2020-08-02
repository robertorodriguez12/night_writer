require_relative 'english_keys'
require 'pry'

class BrailleToEnglish
  include EnglishKeys

  def translation(message)
    split = split_braille(message)
    first_element = get_first_braille_element(split)
    second_element = get_second_braille_element(split)
    final_element = get_final_braille_element(split)
    combined = combine_elements(first_element, second_element, final_element)
    translated = translate_braille(combined)
    join(translated)
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

  def get_final_braille_element(input)
    input.fetch(2).scan(/.{1,2}/)
  end

  def combine_elements(input1, input2, input3)
    input1.zip(input2, input3)
  end

  def translate_braille(input)
    input.map do |letter|
      english_keys[letter]
    end
  end

  def join(combined)
    combined.join
  end
end
