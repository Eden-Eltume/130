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

  def test_change
    cost_of_game = @game.item_cost()
    assert_equal(40, @register.change(@game))
  end
end