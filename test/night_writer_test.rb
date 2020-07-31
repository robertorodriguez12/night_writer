require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/n_w_class'
require 'pry'

class NightWriterTest < MiniTest::Test

  def test_it_exists
    message = "message.txt"
    render_to = "braille.txt"
    # binding.pry
    ARGV[0] = message
    ARGV[1] = render_to
    night_writer = NightWriter.new(message, render_to)

    assert_instance_of NightWriter, night_writer
  end

  # def test_it_can_read_file
  #   message = "message.txt"
  #   night_writer = NightWriter.new
  #
  #   expected = "hello world"
  #   assert_equal expected, night_writer.read
  # end

end
