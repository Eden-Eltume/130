require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open("swap_text.txt")
    read_file = @file.read
    @text = Text.new(read_file)
    @expected_count = read_file.split(' ').count
  end

  def test_word_count
    assert_equal(@expected_count, @text.word_count)
  end

  def teardown
    @file.close
  end
end