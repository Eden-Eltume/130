require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class SameTest < Minitest::Test
  def test_same
    arr1 = [1, 'test', true]
    arr2 = arr1
    arr3 = arr1.clone
    assert_same(arr1, arr2)
    refute_same(arr1, arr3)
    assert_same(arr1[0], arr3[0])
  end
end