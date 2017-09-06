require './lib/game_sequence'
require './lib/messages'
class Battleship
  include Messages

  def initialize
    game_start
  end

  def game_start
    puts start_message
    player_input = gets.chomp
    if player_input == "p" || player_input == "play"
      puts start_game
    elsif player_input == "i" || player_input == "instructions"
      #instructions message need to write
      game_start
    elsif player_input == "q" || player_input =="quit"
      quit_game
    else
      puts invalid_input_message
      game_start
    end
  end

  def start_game
    game = GameSequence.new
  end

  def quit_game
    # quit message
    # exit
  end

end





  # Batteship class should keep score

battleship = Battleship.new
