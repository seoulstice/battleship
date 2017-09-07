require './lib/ship_coordinates'
require './lib/board'
module Messages
  include ShipCoordinates

  def start_message
    puts "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instruction_message
    puts "How to play BATTLESHIP :\nBATTLESHIP is an intense game of luck and skill. The game is played on two separate 4x4 grids with rows assigned from A..D and columns assigned from 1..4.  After both players place their destroyer(2-unit ship) and battleship(3-unit ship) on their own respective boards, the main game sequence begins.  During the main game phase, players take turns firing on each other.  A winner is determined when all opponent ships have been hit and sunk.\n\n"
  end

  def invalid_input_message
    puts "Invalid input, try again.\n\n"
  end

  def start_game_message
    puts "Please wait a moment while the computer places its ships."
  end

  def computer_ship_placement_complete_message
    puts "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The destroyer is two units long and the
    battleship is three units long.
    The grid has A1 at the top left and D4 at the bottom right."
  end

  def destroyer_first_coordinate_message
    puts "Enter the first coordinate for the destroyer:"
  end


  def destroyer_second_coordinate_message
    puts "Enter the second coordinate for the destroyer:"
  end

  def destroyer_successful_placement_message
    puts "You've successfully placed your destroyer on the board.\n\n"
  end

  def destroyer_unsuccessful_placement_message
    puts "Ships cannot be overlapping, reposition destroyer:"
  end

  def successful_ship_placement_message
    puts "     You've successfully placed your ships!\n
     Prepare for a game of BATTLESHIP!!!\n\n"
  end

  def battleship_coordinate_display_message
    puts "Your battleship is currently placed on spaces: #{self.battleship[0]}, #{self.battleship[1]}, #{self.battleship[2]}\n\n"
  end

  def battleship_successful_placement_message
    puts "You've successfully placed your battleship on the board.\n\n"
  end

  def battleship_first_coordinate_message
    puts "Enter the first coordinate for the battleship:"
  end

  def battleship_second_coordinate_message
    puts "Enter the second coordinate for the battleship:"
  end

  def battleship_third_coordinate_message
    puts "Enter the third coordinate for the battleship:"
  end

  def computer_ship_hit_message
    puts "The computer has hit your ship!"
  end

  def player_hit_ship_message
    puts "You've hit a ship!"
  end

  def computer_turn_message
    puts "It is now time for the computer to take a turn.\n\n"
  end

  def player_miss_message
    puts "You've missed!\n\n"
  end

  def computer_ship_miss_message
    puts "The computer has missed!"
  end

  def player_shot_prompt_message
    puts "It is now time for you choose your valid target coordinate:"
  end

  def invalid_player_invalid_target_message
    puts "Invalid target, player cannot target\na previously targeted grid square."
  end

  def invalid_player_coord_placement_message
     puts "Invalid Coordinate!\n
     Valid coordinates range from\n
     A1-A4, B1-B4, C1-C4, and D1-D4."
  end

  def quit_message
    puts "You've decided to QUIT the game.  Bye!"
  end

  def player_win_message
    puts "Congratulations, you've won the game of BATTLESHIP!!!"
  end

  def computer_win_message
    puts "Womp, Womp!!! You've the game of BATTLESHIP lost to a lowly computer!"
  end

end
