require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  # b = Battleship.new
  def test_it_exists
    ship = Battleship.new
    assert_instance_of Battleship, ship
  end

  def test_start_game
    ship = Battleship.new
    ship.start_game("A1", "A2")
  end



end
