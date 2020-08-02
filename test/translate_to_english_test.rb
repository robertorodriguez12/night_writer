require './test/test_helper'
require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/translate_to_english'
require 'pry'

class BrailleToEnglishTest < MiniTest::Test

  def test_it_exists
    translator = BrailleToEnglish.new
    assert_instance_of BrailleToEnglish, translator
  end

  def test_it_can_split_braille
    translator = BrailleToEnglish.new
    input = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
    expected = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    assert_equal expected, translator.split_braille(input)
  end

end
