require './test/test_helper'
require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/file_writer'
require 'pry'

class FileWriterTest < MiniTest::Test

  def test_it_exists
    file_writer = FileWriter.new

    assert_instance_of FileWriter, file_writer
  end


end
