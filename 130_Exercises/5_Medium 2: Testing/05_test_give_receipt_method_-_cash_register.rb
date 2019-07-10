require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(200)
    @game = Transaction.new(60)
  end

  def test_receipt
    item_cost = 60
    assert_output("You've paid $#{item_cost}.\n") { @register.give_receipt(@game) }
  end
end