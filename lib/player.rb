require './lib/board'
require './lib/ship_coordinates'
require './lib/messages'
require './lib/computer_ai'

class Player
  include Messages
  attr_accessor :board,
                :board_selection,
                :destroyer,
                :destroyer1,
                :destroyer2,
                :submarine1,
                :submarine2,
                :submarine3,
                :submarine

  def initialize
    @board = Board.new
    @board_selection = ["A1", "A2", "A3", "A4",
                        "B1", "B2", "B3", "B4",
                        "C1", "C2", "C3", "C4",
                        "D1", "D2", "D3", "D4"]
    @destroyer = []
    @submarine = []
    @destroyer1 = ""
    @destroyer2 = ""
    @submarine1 = ""
    @submarine2 = ""
    @submarine3 = ""
  end

  def place_ships_on_board
    submarine.each do |coordinate|
      @board.board[coordinate][:occupied] = true
    end
    destroyer.each do |coordinate|
      @board.board[coordinate][:occupied] = true
    end
  end

  def ship_placement_validation
    comparison = destroyer & submarine
    comparison.empty?
  end

  def create_ships
    create_submarine
    puts submarine_coordinate_display_message
    create_destroyer
    until ship_placement_validation == true
      puts destroyer_unsuccessful_placement_message
      destroyer.clear
      self.create_destroyer
    end
    puts destroyer_successful_placement_message +
        successful_ship_placement_message
  end

  def create_destroyer
    make_first_destroyer_coordinates
    make_second_destroyer_coordinates
  end

  def make_first_destroyer_coordinates
    puts destroyer_first_coordinate_message
    @destroyer1 = user_input
    if first_coordinate_validity(destroyer1) == true
      destroyer << destroyer1
    else
      puts invalid_input_message
      self.make_first_destroyer_coordinates
    end
  end


  def make_second_destroyer_coordinates
    puts destroyer_second_coordinate_message
    @destroyer2 = user_input
    if second_coordinate_validity(@destroyer1, @destroyer2) == true
      destroyer << destroyer2
    else
      puts invalid_input_message
      self.make_second_destroyer_coordinates
    end
  end

  def create_submarine
    make_first_submarine_coordinates
    make_second_submarine_coordinates
    make_third_submarine_coordinates
  end

  def make_first_submarine_coordinates
    puts submarine_first_coordinate_message
    @submarine1 = user_input
    if first_coordinate_validity(submarine1) == true
      submarine << submarine1
    else
      puts invalid_input_message
      self.make_first_submarine_coordinates
    end
  end

  def make_second_submarine_coordinates
    puts submarine_second_coordinate_message
    @submarine2 = user_input
    if second_coordinate_validity(@submarine1, @submarine2) == true
      submarine << submarine2
    else
      puts invalid_input_message
      self.make_second_submarine_coordinates
    end
  end

  def make_third_submarine_coordinates
    puts submarine_third_coordinate_message
    @submarine3 = user_input
    if third_coordinate_validity(@submarine1, @submarine2, @submarine3) == true
      submarine << submarine3
      puts submarine_successful_placement_message
    else
      puts invalid_input_message
      self.make_third_submarine_coordinates
    end
  end

  def user_input
    gets.chomp
  end

  def first_coordinate_validity(input)
    ship_first_space.include?(input)
  end

  def second_coordinate_validity(input1, input2)
    ship_second_space[input1].include?(input2)
  end

  def third_coordinate_validity(input1, input2, input3)
    key = []
    key << input1 << input2
    ship_third_space[key.sort].include?(input3)
  end

  def ship_placement_validation
    comparison = destroyer & submarine
    comparison.empty?
  end
end
