
module Messages

  def start_message
    puts "\n
    Welcome to BATTLESHIP

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instruction_message
    puts "\n
          How to Play Battleship
          ----------------------"
  end
  def invalid_input_message
    puts "Invalid input, try again."
  end

  def start_game_message
    puts "Please wait a moment while the computer places its ships."
  end

  def ship_placement_message
    puts "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship:"
  end

  def ship_hit_message
    puts "Ship hit!"
  end

end
