require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class OddTest < Minitest::Test
  def setup
    @value = 4
  end
  def test_value
    assert_equal(true, @value.odd?)
  end
end