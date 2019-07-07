require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ExceptionTest < Minitest::Test
  def test_exception
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end