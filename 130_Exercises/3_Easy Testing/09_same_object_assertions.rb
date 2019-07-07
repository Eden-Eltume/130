require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    self
  end
end

class SameTest < Minitest::Test
  def setup
    @list = List.new
  end

  def test_same
    assert_same(@list, @list.process)
  end
end