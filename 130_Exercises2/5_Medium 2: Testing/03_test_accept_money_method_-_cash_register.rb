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

  def test_accept_money
    @transaction.amount_paid = 100
    take_money = @register.accept_money(@transaction)
    assert_equal(300, take_money)
  end
end