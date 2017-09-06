
class GameSequence

  def initialize

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
    # if #check if player hit/won
      #win message
      #shot count to win
      #time to win

    computer.shot_sequence
    #check if computer hit/won
    #add 1 to computer shot counter
  end

end
