require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(200)
    @game = Transaction.new(60)
    @game.amount_paid = 100
  end

  def test_accept_money
    assert_equal(100, @game.amount_paid)
    assert_equal(300, @register.accept_money(@game))
  end
end