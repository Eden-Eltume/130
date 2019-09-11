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
    @transaction.prompt_for_payment(input: string_input)
    assert_equal(100, @transaction.amount_paid)
  end
end