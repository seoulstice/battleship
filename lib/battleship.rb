require './lib/player'
require './lib/computer_ai'
require './lib/messages'
class Battleship
  include Messages

  def initialize
    @shot_count = 0
  end

  def game_sequence

  end

  def placement_of_ships(player, computer)
    computer.create_ships
    computer.place_ships_on_board
    puts computer_ship_placement_complete_message
    player.create_ships
  end

  def shot_sequence(player, computer)
    player.shot_sequence
    #add 1 to player_shot_counter
    if #check if player hit/won
      #win message
      #shot count to win
      #time to win

    computer.shot_sequence
    #check if computer hit/won
    #add 1 to computer shot counter


  end

  # Batteship class should keep score
end
