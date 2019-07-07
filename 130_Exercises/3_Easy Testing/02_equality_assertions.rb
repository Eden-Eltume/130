require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class DowncaseTest < Minitest::Test
  def setup
    @value = 'Eden'
  end

  def test_all_downcase
    assert_equal('eden', @value.downcase)
  end
end