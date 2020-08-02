require_relative 'english_keys'
require 'pry'

class BrailleToEnglish
  include EnglishKeys

  def translation(message)

  end

  def split_braille(message)
    length = message.length / 3
    message.scan(/.{1,#{length}}/)
    # binding.pry
  end
end
