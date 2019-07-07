require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedTest < Minitest::Test
  def setup
    @arr = ["xyz"]
  end

  def test_included
    assert_equal(true, @arr.include?('xyz'))
  end
end