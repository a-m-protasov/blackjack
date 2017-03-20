class Hand
  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def cards(visible = false)
    card_method = visible ? :to_s : :hidden
    @cards.map(&card_method).join(' ')
  end

  def points
    count_aces = @cards.count { |card| card.points == 11 }
    points = @cards.inject(0) { |sum, card| sum + card.points }
    count_aces.times do
      break if points <= 21
      points -= 10
    end
    points
  end
end
