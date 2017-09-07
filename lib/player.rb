require './lib/board'
require './lib/computer_ai'
require './lib/ship_coordinates'
require './lib/messages'
require './lib/validations'
require './lib/player_validations'
class Player
  include ShipCoordinates
  include Messages
  include Validations
  include PlayerValidations
  attr_accessor :board,
                :board_selection,
                :destroyer,
                :destroyer1,
                :battleship,
                :battleship1,
                :battleship2,
                :rounds_on_target

  def initialize
    @board = Board.new
    @destroyer = []
    @battleship = []
    @destroyer1 = ""
    @battleship1 = ""
    @battleship2 = ""
    @rounds_on_target = []
  end

  def place_ships_on_board
    battleship.each do |coordinate|
      @board.board[coordinate][:occupied] = true
    end
    destroyer.each do |coordinate|
      @board.board[coordinate][:occupied] = true
    end
  end

  def create_ships
    create_battleship
    battleship_coordinate_display_message
    create_destroyer
    until ship_placement_validation == true
      destroyer_unsuccessful_placement_message
      destroyer.clear
      self.create_destroyer
    end
    destroyer_successful_placement_message
    successful_ship_placement_message
  end

  def create_destroyer
    make_first_destroyer_coordinates
    make_second_destroyer_coordinates
  end

  def make_first_destroyer_coordinates
    destroyer_first_coordinate_message
    @destroyer1 = user_input
    if first_coordinate_validity(destroyer1) == true
      destroyer << destroyer1
    else
      invalid_input_message
      self.make_first_destroyer_coordinates
    end
  end

  def make_second_destroyer_coordinates
    destroyer_second_coordinate_message
    destroyer2 = user_input
    if second_coordinate_validity(@destroyer1, destroyer2) == true
      destroyer << destroyer2
    else
      invalid_input_message
      self.make_second_destroyer_coordinates
    end
  end

  def create_battleship
    make_first_battleship_coordinates
    make_second_battleship_coordinates
    make_third_battleship_coordinates
  end

  def make_first_battleship_coordinates
    battleship_first_coordinate_message
    @battleship1 = user_input
    if first_coordinate_validity(battleship1) == true
      battleship << battleship1
    else
      invalid_input_message
      self.make_first_battleship_coordinates
    end
  end

  def make_second_battleship_coordinates
    battleship_second_coordinate_message
    @battleship2 = user_input
    if second_coordinate_validity(@battleship1, @battleship2) == true
      battleship << battleship2
    else
      invalid_input_message
      self.make_second_battleship_coordinates
    end
  end

  def make_third_battleship_coordinates
    battleship_third_coordinate_message
    battleship3 = user_input
    if third_coordinate_validity(@battleship1, @battleship2, battleship3) == true
      battleship << battleship3
      battleship_successful_placement_message
    else
      invalid_input_message
      self.make_third_battleship_coordinates
    end
  end

  def user_input
    gets.chomp
  end

  def firing_sequence(computer_board)
    player_shot_prompt_message
    target = user_input
    if determine_if_user_input_is_valid(target, computer_board) == true
      if determine_target_previously_shot_at(target, computer_board) == false
        if determine_target_occupation_status(target, computer_board) == true
          computer_board.board[target][:symbol] = "\u{1F4A5}"
          computer_board.board[target][:shot_at] = true
          @rounds_on_target << target
          player_hit_ship_message
        elsif determine_target_occupation_status(target, computer_board) == false
          computer_board.board[target][:symbol] = "\u{2716}"
          computer_board.board[target][:shot_at] = true
          player_miss_message
        end
      elsif determine_target_previously_shot_at(target, computer_board) == true
        invalid_player_invalid_target_message
        self.firing_sequence(computer_board)
      end
    elsif determine_if_user_input_is_valid(target, computer_board) == false
      invalid_input_message
      self.firing_sequence(computer_board)
    end
  end

  def check_target_on_opponent_board(opponent, target)
    if opponent.destroyer.include?(target)
      opponent.destroyer.delete(target)
    elsif opponent.battleship.include?(target)
      opponent.battleship.delete(target)
    end
  end

  def check_if_ship_sunk(opponent)
    if opponent.destroyer.length == 0
      destroyer_sunk_message
    elsif opponent.battleship.length == 0
      battleship_sunk_message
    end
  end
end
