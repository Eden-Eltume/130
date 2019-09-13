require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '08_swap_letters_sample_text_and_starter_file'

class Test_Text < Minitest::Test
  def setup
    @sample_text = File.open("08_sample_text.txt")
    file = File.open("08_sample_text.txt")
    @text = Text.new(file.read)
  end

# fix test_swap to return modified text
  def test_swap
    expected_text =
      @sample_text.each_line.map do |line|
        line.split(' ').map do |word|
          word.split.map{|char| char == 'e' ? 'o' : char}.join
        end.join(' ')
      end 

    assert_equal(File.open(expected_text).read, @text.swap("e", "o"))
  end

  def teardown
    @sample_text.close
  end
end