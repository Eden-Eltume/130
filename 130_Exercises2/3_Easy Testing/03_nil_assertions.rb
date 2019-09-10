require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < Minitest::Test
  def test_nil
    assert(nil.nil?)
  end
end