require 'minitest/autorun'
require 'minitest/emoji'
require './lib/gameboard_space'

class ShipPlacementTest < Minitest::Test

  def test_gameboard_space_exists
    gb = ShipPlacement

    assert_instance_of ShipPlacement, gb
  end
end
