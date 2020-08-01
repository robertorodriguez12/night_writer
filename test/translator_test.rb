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
end
