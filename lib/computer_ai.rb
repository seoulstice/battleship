require './lib/ship_coordinates'
require './lib/board'
require 'pry'

class ComputerAI
  include ShipCoordinates
  attr_accessor :board
  attr_reader :destroyer,
              :submarine
  def initialize
    @board = Board.new
    @destroyer = []
    @submarine = []
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
