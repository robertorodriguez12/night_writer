require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/night_writer'
require 'pry'

class NightWriterTest < MiniTest::Test

  def test_it_exists_and_attributes
    night_writer = NightWriter.new
    assert_instance_of NightWriter, night_writer
    assert_instance_of FileReader, night_writer.reader
  end

end
