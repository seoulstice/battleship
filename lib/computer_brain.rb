require './lib/ship_placement'
require 'pry'

class ComputerBrain
  include ShipPlacement

  def initialize
    @destoyer_first_coord   = ""
    @destroyer_second_coord = ""
    @submarine_first_coord  = ""
    @submarine_second_coord = ""
    @submarine_third_coord  = ""
  end

  def create_destroyer
    @destoyer_first_coord << choose_first_coord
  end

  def create_submarine

  end

  def choose_first_coord
    board_space.sample

  end

  def choose_second_coord


  end

  def choose_third_coord

  end
end

cb = ComputerBrain.new
cb.choose_first_coord
