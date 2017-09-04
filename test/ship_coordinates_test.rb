require 'minitest/autorun'
require 'minitest/emoji'
require './lib/ship_coordinates'

class ShipCoordinateTest < Minitest::Test

  def test_gameboard_space_exists
    ship = ShipCoordinates

    assert_ ShipCoordinates, ship
  end
end
