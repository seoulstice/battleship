require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard'
require 'pry'

class GameboardTest < Minitest::Test
  def test_it_exists
    board = Gameboard.new
    assert_instance_of Gameboard, board
  end

  def test_value_starts_empty
    board = Gameboard.new
    assert_equal "empty", board.game_board["A1"]
  end

  # def test_setting_value_to_occupied
  #   board = Gameboard.new
  #   board.occupy("A1")
  #   assert_equal "occupied", board.game_board["A1"]
  # end

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

  def test_can_place_two_unit_ship
    board = Gameboard.new
    # board.place_two_unit_ship("A1", "A2")
    assert_equal "occupied", board.game_board["A1", "A2"]
    assert_equal "occupied", board.game_board["A2"]
  end

  # def test_cant_place


end
