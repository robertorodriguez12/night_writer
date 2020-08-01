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


end
