require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Employee
  def hire
    raise("NoExperienceError")
  end
end

class ExperienceTest < Minitest::Test
  def test_experience
    employee = Employee.new
    assert_raises("NoExperienceError"){ employee.hire }
  end
end