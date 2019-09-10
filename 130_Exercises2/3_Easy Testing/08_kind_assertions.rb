require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TypeTest < Minitest::Test
  def test_type
    assert_kind_of(Numeric, 3)
  end
end