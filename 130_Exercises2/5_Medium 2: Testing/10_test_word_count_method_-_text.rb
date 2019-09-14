require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '08_swap_letters_sample_text_and_starter_file'

class Test_Text < Minitest::Test
  def setup
    @sample_text = File.open("08_sample_text.txt").read
    @file = File.open("08_sample_text.txt")
    @text = Text.new(@file.read)
  end

  def test_word_count
    counter = 0
      @sample_text.split("\n").each do |line|
        line.split(" ").each do |word|
          counter += 1
        end
      end

    actual_word_count = @text.word_count  
    assert_equal(counter, actual_word_count)
  end

  def teardown
    @file.close
  end
end