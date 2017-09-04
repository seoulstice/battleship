require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def test_player_exists
    player = Player.new
binding.pry
    assert_instance_of Player, player
  end

  def test_player_has_a_board
    player = Player.new

    assert_instance_of Board, player.board
  end

  def test_player_has_empty_destroyer_by_default
    player = Player.new

    assert_equal [], player.destroyer
    assert_equal 0, player.destroyer.length
  end

  def test_player_has_empty_submarine_by_default
    player = Player.new

    assert_equal [], player.submarine
    assert_equal 0, player.submarine.length
  end


  def test_player_can_place_once
    skip
  end


end
