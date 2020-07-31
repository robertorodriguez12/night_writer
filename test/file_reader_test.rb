require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/file_reader'
require 'pry'

class FileReaderTest < MiniTest::Test

  def test_it_exists
    file_reader = FileReader.new
    assert_instance_of FileReader, file_reader
  end

  def test_it_can_read
    if ARGV[0] == "message.txt"
      file_reader = FileReader.new
      expected = "Hello world"
      actual = file_reader.read_file
      assert_equal expected, actual
    end
  end

end
