require './lib/board'
require './lib/player'
require './lib/ship_coordinates'
require './lib/messages'
require './lib/validations'


class ComputerAI
  include ShipCoordinates
  include Messages
  include Validations
  attr_accessor :board
  attr_reader :destroyer,
              :battleship,
              :rounds_on_target
  def initialize
    @board = Board.new
    @destroyer = []
    @battleship = []
    @rounds_on_target = []
  end

  def create_ships
    create_destroyer
    create_battleship
    if ship_placement_validation == false
      destroyer.clear
      battleship.clear
      self.create_ships
    end
  end

  def choose_target(player_board)
    player_board.board.keys.sample
  end

  def firing_sequence(player_board)
    target = choose_target(player_board)
    if determine_target_previously_shot_at(target, player_board) == true
      self.firing_sequence(player_board)
    elsif determine_target_previously_shot_at(target, player_board) == false
      if determine_target_occupation_status(target, player_board) == true
        player_board.board[target][:symbol] = "\u{1F4A5}"
        player_board.board[target][:shot_at] = true
        @rounds_on_target << target
        puts computer_ship_hit_message
      elsif determine_target_occupation_status(target, player_board) == false
        player_board.board[target][:symbol] = "\u{2716} "
        player_board.board[target][:shot_at] = true
        puts computer_ship_miss_message
      end
    end
  end

  def confirm_hit_or_miss(target)
    if @target_board.board[target][:occupied] = true
      @target_board.board[target][:symbol] = "H"
    else
      @target_board.board[target][:symbol] = "H"
    end
  end

  def place_ships_on_board
    battleship.each do |coordinate|
      @board.board[coordinate][:occupied] = true
    end
    destroyer.each do |coordinate|
      @board.board[coordinate][:occupied] = true
    end
  end

  def create_destroyer
    key = first_coordinate
    destroyer << key << second_coordinate(key)
  end

  def create_battleship
    key = []
    battleship << (first_tile = first_coordinate)
    battleship << (second_tile = second_coordinate(first_tile))
    key << first_tile << second_tile
    battleship << ship_third_space[key.sort].sample
  end

  def first_coordinate
    ship_first_space.sample
  end

  def second_coordinate(key)
    ship_second_space[key].sample
  end

  def third_coordinate(key)
    ship_third_space[key].sample
  end

  def check_rounds_on_target_against_opponent_destroyer(opponent)
    shared = opponent.board.destroyer & rounds_on_target
    if shared.length == 2
      destroyer_sunk_message
    end
  end

  def check_rounds_on_target_against_opponent_battleship(opponent)
    shared = opponent.board.battleship & rounds_on_target
    if shared.length == 3
      battleship_sunk_message
    end
  end
end
