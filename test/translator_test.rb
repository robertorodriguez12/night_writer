require './test/test_helper'
require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/translator'
require 'pry'

class TranslatorTest < MiniTest::Test

  def test_it_exists
    translator = Translator.new
    assert_instance_of Translator, translator
  end

  def test_it_can_split_message
    translator = Translator.new
    expected = ["h", "i"]
    assert_equal expected, translator.split_characters("hi")
  end

  def test_it_can_translate_letters
    translator = Translator.new
    assert_equal [["0.", "00", ".."]],  translator.translate_to_braille(["h"])
    assert_equal [["0.", ".0", "00"]],  translator.translate_to_braille(["z"])
  end

  def test_it_can_translate_multiple_letters
    translator = Translator.new
    expected_1 = [["0.", "00", ".."], [".0", "0.", ".."]]
    expected_2 = [["0.", "00", ".."],
                ["0.", ".0", ".."],
                ["0.", "0.", "0."],
                ["0.", "0.", "0."],
                ["0.", ".0", "0."]]

    assert_equal expected_1, translator.translate_to_braille(["h", "i"])
    assert_equal expected_2, translator.translate_to_braille(["h", "e", "l", "l", "o"])
  end

  def test_it_can_transpose_the_output
    translator = Translator.new
    expected = [["0.", "0.", "0.", "0.", "0."],
                ["00", ".0", "0.", "0.", ".0"],
                ["..", "..", "0.", "0.", "0."]]

    actual = [["0.", "00", ".."],
              ["0.", ".0", ".."],
              ["0.", "0.", "0."],
              ["0.", "0.", "0."],
              ["0.", ".0", "0."]]
    assert_equal expected, translator.transpose(actual)
  end

  def test_it_can_create_a_string_from_translate_message
    translator = Translator.new
    actual = [["0.", "0.", "0.", "0.", "0."],
              ["00", ".0", "0.", "0.", ".0"],
              ["..", "..", "0.", "0.", "0."]]
    expected = ["0.0.0.0.0.",
                "00.00.0..0",
                "....0.0.0."]
    assert_equal expected, translator.create_strings(actual)
  end

end
