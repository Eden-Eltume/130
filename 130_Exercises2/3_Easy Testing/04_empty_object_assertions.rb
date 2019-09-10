require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyListTest < Minitest::Test
  def test_list_empty
    assert([].empty?)
  end
end