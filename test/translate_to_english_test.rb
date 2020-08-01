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

end
