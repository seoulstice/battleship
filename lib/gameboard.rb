require 'pry'
class Gameboard
  attr_reader :game_board

  def initialize
    @game_board = { "A1" => "empty", "A2" => "empty", "A3" => "empty", "A4" => "empty",
                      "B1" => "empty", "B2" => "empty", "B3" => "empty", "B4" => "empty",
                      "C1" => "empty", "C2" => "empty", "C3" => "empty", "C4" => "empty",
                      "D1" => "empty", "D2" => "empty", "D3" => "empty", "D4" => "empty"
    }
  end

  def validate_small_ship

  end
  # def create_computer_board(ship1, ship2)
  #
  # end


  # def set_board(x, y)
  #   create_board[x] = "full"
  #   create_board[y] = "full"
  #   binding.pry
  # end



end
