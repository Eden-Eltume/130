require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NotNilTest < Minitest::Test
  def setup
    @value = nil
  end

  def test_not_nil
    assert_equal(nil, @value)
  end
end