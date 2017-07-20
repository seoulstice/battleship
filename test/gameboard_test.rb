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

  def test_can_place_frigate
    board = Gameboard.new

    board.place_frigate("A1", "A2")

    assert_equal "occupied", board.game_board["A1"]
    assert_equal "occupied", board.game_board["A2"]
  end

  def test_cant_place_frigate_off_board
    board = Gameboard.new

    board.place_frigate("A4", "A5")

    assert_equal "empty", board.game_board["A4"]
    assert_nil board.game_board["A5"]
  end

  def test_cant_place_frigate_off_board_two
    board = Gameboard.new

    board.place_frigate("A5", "A4")

    assert_equal "empty", board.game_board["A4"]
    assert_nil board.game_board["A5"]
  end

  def test_cant_pass_invalid_space
    board = Gameboard.new

    board.place_frigate("A1", "")

    assert_equal "empty", board.game_board["A1"]
    assert_nil board.game_board[""]

  end

  def test_cant_place_frigate_in_separated_horizontal_spaces
    board = Gameboard.new

    board.place_frigate("A1", "A3")

    assert_equal "empty", board.game_board["A1"]
    assert_equal "empty", board.game_board["A3"]
  end

  def test_cant_place_frigate_in_separated_vertical_spaces
    board = Gameboard.new

    board.place_frigate("A1", "C1")

    assert_equal "empty", board.game_board["A1"]
    assert_equal "empty", board.game_board["C1"]
  end

  def test_cant_place_frigate__diagonally
    board = Gameboard.new

    board.place_frigate("A1", "B2")

    assert_equal "empty", board.game_board["A1"]
    assert_equal "empty", board.game_board["B2"]
  end
end
