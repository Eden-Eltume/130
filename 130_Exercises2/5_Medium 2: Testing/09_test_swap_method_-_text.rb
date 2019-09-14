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

  def test_swap
    expected_text =
      @sample_text.split("\n").map do |line|
        line.split(" ").map do |word|
          word.chars.map{|char| char == "e" ? "o" : char}.join
        end.join(" ")
      end.join("\n")

    actual_result = @text.swap("e", "o")
    assert_equal(expected_text, actual_result)
  end

  def teardown
    @file.close
  end
end