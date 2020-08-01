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
    # This method is taking the first element of every
    #array that was created during the translation and placing them in to a new array
    # i'm doing this here so that I can format it later to properly stack for the braille.
  end

  def create_strings(transposed)
    rows = []
    transposed.each do |line|
      rows << line.join
    end
    rows
  end

  def create_braille_letter_structure(string)
    string.join("\n")
  end

end
