require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '/battleship'

class BattleshipTest < Minitest::Test

  def test_it_exists
    ship = Battleship.new

    assert_instance_of Battleship, ship
  end




end
