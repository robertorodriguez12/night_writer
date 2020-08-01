require_relative 'braille_keys'
require 'pry'

class Translator
  include BrailleKeys
# binding.pry
  def translation(message)
    split      = split_characters(message)
    braille    = translate_to_braille(split)
    transposed = transpose(braille)
    strings    = create_strings(transposed)
    format_lines(strings)
  end

  def split_characters(message)
    # binding.pry
    message.chars
  end

  def translate_to_braille(split)
    split.map do |letter|
      braille_keys[letter]
    end
  end

  def transpose(braille)
    braille.transpose
  end

end
