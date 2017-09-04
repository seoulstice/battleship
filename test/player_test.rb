require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_player_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_player_has_a_board
    player = Player.new

    assert_instance_of Board, player.board
  end

end
