require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard'

class GameboardTest < Minitest::Test
  def test_it_exists
    board = Gameboard.new
    assert_instance_of Gameboard, board
  end

end
