require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(200)
    @transaction = Transaction.new(60)
  end

  def test_prompt_for_payment
    string_input = StringIO.new('100\n')
    test_output = StringIO.new
    @transaction.prompt_for_payment(input: string_input, output: test_output)
    assert_equal(100, @transaction.amount_paid, msg = nil)
  end
end