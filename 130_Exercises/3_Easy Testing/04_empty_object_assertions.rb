require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyArrayTest < Minitest::Test
  def setup
    @arr = []
  end

  def test_array_empty
    assert_equal(true, @arr.empty?)
  end
end