require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludesTest < Minitest::Test
  def test_includes
    list = ["xyz"]
    assert_includes(list, "xyz")
  end
end