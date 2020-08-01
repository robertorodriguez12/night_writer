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

  def test_it_can_break_translated_message_to_depict_braille_letters_structure
    translator = Translator.new
    actual = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]
    expected = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."

    assert_equal expected, translator.create_braille_letter_structure(actual)
  end

  def test_it_can_keep_lines_under_eighty
    translator = Translator.new
    input = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.",
              "..................................................................................",
              ".................................................................................."]
    expected = [["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0."], ["................................................................................", ".."], ["................................................................................", ".."]]
    assert_equal expected, translator.keep_under_80(input)
  end

  def test_it_can_format_lines_over_eighty
    translator = Translator.new
    input = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.",
              "..................................................................................",
              ".................................................................................."]
    expected = [["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0."],
              ["................................................................................", ".."],
              ["................................................................................", ".."]]
    assert_equal expected, translator.create_braille_letter_structure(input)
  end

  def test_it_can_translate_and_format
    translator = Translator.new
    message = "helloworld"
    expected =   "0.0.0.0.0..00.0.0.00\n00.00.0..000.0000..0\n....0.0.0..00.0.0..."
    # binding.pry
    assert_equal expected, translator.translation(message)
  end

end
