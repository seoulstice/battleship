require 'minitest/emoji'
require 'minitest/autorun'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_a_board
    board = Board.new

    assert board.board
  end
end
