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
    if first_coordinate_validity(destroyer1) == true
      destroyer << destroyer1
    else
      puts invalid_input_message
      self.make_first_destroyer_coordinates
    end
  end

  def create_submarine
    make_first_submarine_coordinates
    make_second_submarine_coordinates
    make_third_submarine_coordinates
  end

  def make_second_destroyer_coordinates
    puts destroyer_second_coordinate_message
    @destroyer2 = get_ship_coordinates_from_user
    if second_coordinate_validity(@destroyer1, @destroyer2) == true
      destroyer << destroyer2
      destroyer_successful_placement
    else
      puts invalid_input_message
      @destroyer.delete_at(1)
      self.make_second_destroyer_coordinates
    end
  end

  def make_first_submarine_coordinates
    puts submarine_first_coordinate_message
    @submarine1 = get_ship_coordinates_from_user
    if first_coordinate_validity(submarine1) == true
      submarine << submarine1
    else
      puts invalid_input_message
      self.make_first_submarine_coordinates
    end
  end

  def make_second_submarine_coordinates
    puts submarine_second_coordinate_message
    @submarine2 = get_ship_coordinates_from_user
    if second_coordinate_validity(@submarine1, @submarine2) == true
      submarine << submarine2
    else
      puts invalid_input_message
      # destroyer.delete_at(1)
      self.make_second_submarine_coordinates
    end
  end

  def make_third_submarine_coordinates
    puts submarine_third_coordinate_message
    @submarine3 = get_ship_coordinates_from_user
    if third_coordinate_validity(@submarine1, @submarine2, @submarine3) == true
      submarine << submarine3
    else
      puts invalid_input_message
      self.make_third_submarine_coordinates
    end
  end

  def get_ship_coordinates_from_user
    gets.chomp
  end

  def first_coordinate_validity(input)
    board_selection.include?(input)
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
