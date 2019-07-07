require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < Minitest::Test
  def setup
    @value = 3.14
  end

  def test_kind
    assert_equal(true, @value.class.ancestors.include?(Numeric))
  end
end