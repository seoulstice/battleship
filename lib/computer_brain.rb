require './lib/ship_placement'
require './lib/computer_board'
require 'set'
require 'pry'

class ComputerBrain
  include ShipPlacement
  attr_accessor :board
  attr_reader :destroyer,
              :submarine
  def initialize
    @board = ComputerBoard.new
    @destroyer = []
    @submarine = []
  end

  def place_ships
    create_destroyer
    create_submarine
    if validate_correct_ship_placement == false
      destroyer.clear
      submarine.clear
      self.place_ships
    end
  end

  def validate_correct_ship_placement
    comparison = destroyer & submarine
    comparison.empty?
  end

  def create_destroyer
    key = first_coordinate
    destroyer << key
    destroyer << second_coordinate(key)
  end

  def create_submarine
    key = []
    first_tile = first_coordinate
    second_tile = second_coordinate(first_tile)
    key << first_tile << second_tile
    submarine << first_tile
    submarine << second_tile
    submarine << board_third_space[key.sort].sample
  end

  def first_coordinate
    first = board_first_space.sample
  end

  def second_coordinate(key)
    board_second_space[key].sample
  end

  def third_coord(key)
    board_third_space[key].sample
  end
end

cb = ComputerBrain.new
