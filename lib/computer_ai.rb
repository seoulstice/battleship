require './lib/ship_coordinates'
require './lib/board'
require './lib/player'
require 'pry'

class ComputerAI
  include ShipCoordinates
  attr_accessor :board
  attr_reader :destroyer,
              :submarine,
              :shot_count
  def initialize
    @board = Board.new
    @destroyer = []
    @submarine = []
    @rounds_on_target = []
    @shot_count = 0
  end

  def pull_ship_placement_from_player

  end

  def create_ships
    create_destroyer
    create_submarine
    if ship_placement_validation == false
      destroyer.clear
      submarine.clear
      self.create_ships
    end
  end

  def choose_target(player_board)
    player_board.board.keys.sample
  end

  def determine_target_previously_shot_at(target, player_board)
    if player_board.board[target][:shot_at] = true
      true
    else
      false
    end
  end

  def determine_target_occupation_status(target, player_board)
    if player_board.board[target][:occupied] = true
      true
    else
      false
    end
  end

  def firing_sequence(player_board)
    target = choose_target(player_board)
    if determine_target_previously_shot_at(target, player_board) == true
      self.firing_sequence(player_board)
    else determine_target_previously_shot_at?(target, player_board) == false
      if determine_target_occupation_status(target, player_board) == true
        player_board.board[target][:symbol] = "H"
        player_board.board[target][:shot_at] = true
        # message to announce computer hit ship
      else determine_target_occupation_status(target, player_board) == false
        player_board.board[target][:symbol] = "M"
        player_board.board[target][:shot_at] = true
      end
  end

  # NEED? method to determine which ship is hit

  # NEED method to determine when ship is sunk

  # NEED method to determine how many successfull hits

  # NEED if 5 successful hits win?


  def confirm_hit_or_miss(target)
    if @target_board.board[target][:occupied] = true
      @target_board.board[target][:symbol] = "H"
    else
      @target_board.board[target][:symbol] = "H"
    end
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

  def create_destroyer
    key = first_coordinate
    destroyer << key << second_coordinate(key)
  end

  def create_submarine
    key = []
    submarine << (first_tile = first_coordinate)
    submarine << (second_tile = second_coordinate(first_tile))
    key << first_tile << second_tile
    submarine << ship_third_space[key.sort].sample
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
end
