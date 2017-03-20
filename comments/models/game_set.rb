require_relative 'cards_deck'
require_relative 'hand'

class GameSet
  BET_SIZE = 10

  def initialize(human, dealer)
    @human = human
    @dealer = dealer
    @human.bet(BET_SIZE)
    @dealer.bet(BET_SIZE)
    @bank = BET_SIZE * 2
    @deck = CardsDeck.new
    @human_hand = Hand.new
    @dealer_hand = Hand.new
  end

  def start_set
    take_start_cards

    if @human_hand.points == 21 || @dealer_hand.points == 21
      puts 'Блэк Джек!'
      result
    else
      print_info
      human_turn
    end
  end

  private

  def print_info(show_dealer = false)
    puts "   Вы: #{@human_hand.cards(:visible)}, #{@human_hand.points} очков"
    puts "Дилер: #{@dealer_hand.cards(show_dealer)}, #{show_dealer ? @dealer_hand.points : '* '} очков"

  end

  def human_turn
    puts 'Ваш ход:'
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    loop do
      command = gets.chomp.to_i
      case command
      when 1
        dealer_turn
        break
      when 2
        @human_hand.add_card(@deck.take_a_card)
        dealer_turn
        break
      when 3
        break
      else
        puts 'Ошибка ввода. Попробуйте еще раз:'
      end
    end
    result
  end

  def dealer_turn
    @dealer_hand.add_card(@deck.take_a_card) if @dealer_hand.points < 18
  end

  def result
    print_info(:show_dealer)
    human_points = @human_hand.points
    dealer_points = @dealer_hand.points
    if human_points == dealer_points
      puts 'Ничья.'
      @human.add_cash(@bank / 2)
      @dealer.add_cash(@bank / 2)
    elsif human_points == 21
      human_win
    elsif dealer_points == 21
      dealer_win
    elsif human_points < 21 && dealer_points < 21
      human_points > dealer_points ? human_win : dealer_win
    else
      human_points > dealer_points ? dealer_win : human_win
    end
  end

  def human_win
    puts 'Вы выиграли!'
    @human.add_cash(@bank)
  end

  def dealer_win
    puts 'Вы проиграли.'
    @dealer.add_cash(@bank)
  end

  def take_start_cards
    2.times do
      @human_hand.add_card(@deck.take_a_card)
      @dealer_hand.add_card(@deck.take_a_card)
    end
  end
end
