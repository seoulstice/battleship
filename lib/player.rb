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
                :battleship,
                :battleship1,
                :battleship2,
                :battleship3


  def initialize
    @board = Board.new
    @destroyer = []
    @battleship = []
    @destroyer1 = ""
    @destroyer2 = ""
    @battleship1 = ""
    @battleship2 = ""
    @battleship3 = ""
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
    create_battleship
    puts battleship_coordinate_display_message
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

  def create_battleship
    make_first_battleship_coordinates
    make_second_battleship_coordinates
    make_third_battleship_coordinates
  end

  def make_first_battleship_coordinates
    puts battleship_first_coordinate_message
    @battleship1 = user_input
    if first_coordinate_validity(battleship1) == true
      battleship << battleship1
    else
      puts invalid_input_message
      self.make_first_battleship_coordinates
    end
  end

  def make_second_battleship_coordinates
    puts battleship_second_coordinate_message
    @battleship2 = user_input
    if second_coordinate_validity(@battleship1, @battleship2) == true
      battleship << battleship2
    else
      puts invalid_input_message
      self.make_second_battleship_coordinates
    end
  end

  def make_third_battleship_coordinates
    puts battleship_third_coordinate_message
    @battleship3 = user_input
    if third_coordinate_validity(@battleship1, @battleship2, @battleship3) == true
      battleship << battleship3
      puts battleship_successful_placement_message
    else
      puts invalid_input_message
      self.make_third_battleship_coordinates
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
    comparison = destroyer & battleship
    comparison.empty?
  end
end
