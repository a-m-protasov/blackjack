class Player
  attr_reader :name, :bank

  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
  end

  def bet(value)
    @bank -= value
  end

  def add_cash(value)
    @bank += value
  end
end
