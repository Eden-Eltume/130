require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TypeTest < Minitest::Test
  def setup
    @num = 3
  end

  def test_numeric
    assert_equal(true, @num.is_a?(Numeric))
  end
end