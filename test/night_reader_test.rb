require './test/test_helper'
require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/nr_class'
require 'pry'

class NightReaderTest < MiniTest::Test

  def test_it_exists
    message = "braille.txt"
    render_to = "message.txt"
    ARGV[0] = message
    ARGV[1] = render_to
    night_reader = NightReader.new(message, render_to)
    assert_instance_of NightReader, night_reader
  end



end
