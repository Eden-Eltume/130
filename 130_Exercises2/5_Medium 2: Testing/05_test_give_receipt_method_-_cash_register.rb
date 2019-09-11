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

  def test_give_receipt
    items_price = @transaction.item_cost
    assert_output("You've paid $#{items_price}.\n"){ @register.give_receipt(@transaction) }
  end
end