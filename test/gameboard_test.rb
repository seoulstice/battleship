require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard'

class GameboardTest < Minitest::Test
  def test_it_exists
    board = Gameboard.new
    assert_instance_of Gameboard, board
  end

  def test_value_starts_empty
    board = Gameboard.new
    assert_equal "empty", board.game_board["A1"]
  end

  def test_setting_value_to_occupied
    skip
    board = Gameboard.new

    assert_equal "occupied", board.game_board["A1"]
  end

  def test_setting_value_to_hit
    board = Gameboard.new
    board.hit("A1")
    assert_equal "hit", board.game_board["A1"]
  end

  def test_setting_value_to_miss
    board = Gameboard.new
    board.miss("A1")
    assert_equal "miss", board.game_board["A1"]
  end


end
