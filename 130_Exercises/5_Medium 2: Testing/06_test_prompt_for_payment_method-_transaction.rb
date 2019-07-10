require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @game = Transaction.new(60)
  end

  def test_prompt_for_payment
    input = StringIO.new('60\n')
    @game.prompt_for_payment(input: input)
    assert_equal(60, @game.amount_paid)
  end
end