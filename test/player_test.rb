require 'minitest/autorun'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def test_player_exists
    player = Player.new

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

  def test_player_has_empty_battleship_by_default
    player = Player.new

    assert_equal [], player.battleship
    assert_equal 0, player.battleship.length
  end

  def test_player_has_empty_destroyer1_string
    player = Player.new

    assert_equal "", player.destroyer1
  end

  def test_player_has_empty_battleship1_string
    player = Player.new

    assert_equal "", player.battleship1
  end

  def test_player_has_empty_battleship2_string
    player = Player.new

    assert_equal "", player.battleship2
  end

  def test_player_has_empty_rounds_on_target
    player = Player.new

    assert_equal [], player.rounds_on_target
  end

  def test_player_can_create_ships
    player = Player.new
    player.create_ships

    assert_equal 3, player.battleship.length
    assert_equal 2, player.destroyer.length
  end

  def test_player_can_create_destroyer
    player = Player.new
    player.create_destroyer

    assert_equal 2, player.destroyer.length
  end

  def test_player_can_make_first_destroyer_coord
    player = Player.new
    player.make_first_destroyer_coordinates

    assert_equal 1, player.destroyer.length
  end

  def test_player_can_make_second_destroyer_coord
    player = Player.new
    player.make_second_destroyer_coordinates

    assert_equal 1, player.destroyer.length
  end

  def test_player_can_make_battleship
    player = Player.new
    player.create_battleship

    assert_equal 3, player.battleship.length
  end

  def test_player_can_make_first_battleship_coord
    player = Player.new
    player.make_first_battleship_coordinates

    assert_equal 1, player.battleship.length
  end
end
