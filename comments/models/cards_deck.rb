require_relative 'card'

class CardsDeck
  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'A', 'K', 'Q', 'J'].freeze

  def initialize
    @deck = Array.new(self.class.standart_deck)
    @deck.shuffle!
  end

  def take_a_card
    @deck.pop
  end

  def self.standart_deck
    @standart_deck ||= begin
      deck = []
      SUITS.each do |suit|
        FACES.each { |face| deck << Card.new(face, suit) }
      end
      deck
    end
  end
end
