require './lib/board'
require './lib/ship_coordinates'
require './lib/messages'

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
    @destroyer1 = ""
    @destroyer2 = ""
    @submarine1 = ""
    @submarine2 = ""
    @submarine3 = ""
    @submarine = []
  end

  def create_destroyer
    make_first_destroyer_coordinates
    make_second_destroyer_coordinates
  end


  def make_first_destroyer_coordinates
    puts destroyer_first_coordinate_message
    @destroyer1 = get_ship_coordinates_from_user
    if determine_first_coordinate_validity(destroyer1) == true
      destroyer << destroyer1
    else
      puts invalid_input_message
      self.make_player_destroyer
    end
  end

  def make_second_destroyer_coordinates
    puts destroyer_second_coordinate_message
    @destroyer2 = get_ship_coordinates_from_user
    if determine_second_coordinate_validity(@destroyer1, @destroyer2) == true
      destroyer << destroyer2
      destroyer_successful_placement
    else
      puts invalid_input_message
      @destroyer.clear
      self.make_second_destroyer_coordinates
    end
  end


  def get_ship_coordinates_from_user
    gets.chomp
  end

  def get_destroyer_second_coordinate(input1, input2)
    if determine_second_coordinate_validity(input1, input2) == true
      destroyer << input2
    else
      puts invalid_input_message
      destroyer.delete_at(1)
      self.get_destroyer_second_coordinate
    end
  end

  def determine_first_coordinate_validity(input)
    board_selection.include?(input)
  end

  def determine_second_coordinate_validity(input1, input2)
    ship_second_space[input1].include?(input2)
  end

end
