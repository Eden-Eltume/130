require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class RefuteTest < Minitest::Test
  def setup
    @list = ['xyz']
  end

  def test_includes
    refute(@list.include?('xyz'), "It contains that item")
  end
end