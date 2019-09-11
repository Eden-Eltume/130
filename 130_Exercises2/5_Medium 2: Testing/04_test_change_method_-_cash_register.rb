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

  def test_change
    @transaction.amount_paid = 100
    give_change = @register.change(@transaction)
    assert_equal(40, give_change)
  end
end