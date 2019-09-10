require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludesTest < Minitest::Test
  def test_includes
    az = ['abc', 'xyz']
    refute_includes(az, 'xyz')
  end
end