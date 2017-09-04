require './lib/ship_coordinates'
module Messages
  include ShipCoordinates

  def start_message
    "\n
    Welcome to BATTLESHIP

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instruction_message
    "\n
          How to Play Battleship
          ----------------------"
  end

  def invalid_input_message
    "Invalid input, try again."
  end

  def start_game_message
    puts "Please wait a moment while the computer places its ships."
  end

  def computer_ship_placement_complete_message
    "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The destroyer is two units long and the
    submarine is three units long.
    The grid has A1 at the top left and D4 at the bottom right."
  end

  def destroyer_first_coordinate_message
    "Enter the first coordinate for the destroyer:"
  end


  def destroyer_second_coordinate_message
    "Enter the second coordinate for the destroyer:"
  end

  def destroyer_successful_placement
    "You've successfully placed your destroyer on the board."

  end

  def submarine_first_coordinate_message
    "Enter the first coordinate for the submarine:"
  end

  def submarine_second_coordinate_message
    "Enter the second coordinate for the submarine:"
  end

  def submarine_third_coordinate_message
    "Enter the third coordinate for the submarine:"
  end


  def display_second_coordinate_possibilities(key)
    "Choose one of the following coordinates: \n
          #{ship_second_space[key]}"
  end

  def ship_hit_message
    "Ship hit!"
  end

end
