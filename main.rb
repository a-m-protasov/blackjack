require_relative 'models/cards_deck'
require_relative 'models/card'
require_relative 'models/game_set'
require_relative 'models/player'

print 'Как вас зовут?: '
name = gets.chomp.capitalize
puts "Добро пожаловать в казино, #{name}"
player = Player.new(name)
dealer = Player.new
loop do
  if player.bank.zero?
    puts 'У вас не осталось денег'
    break
  elsif dealer.bank.zero?
    puts 'У дилера не осталось денег'
    break
  end
  puts "У вас: $#{player.bank}, у дилера: $#{dealer.bank}"
  GameSet.new(player, dealer).start_set
  puts 'Играем дальше? (y - да, n - нет)'
  command = gets.chomp
  break unless command.downcase == 'y'
end
