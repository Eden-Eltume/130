require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class OddTest < Minitest::Test
  def test_odd
    assert(3.odd?)
  end
end