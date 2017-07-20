require 'pry'
class Gameboard
  attr_reader :game_board

  def initialize
    @game_board = { "A1" => "empty", "A2" => "empty", "A3" => "empty", "A4" => "empty",
                    "B1" => "empty", "B2" => "empty", "B3" => "empty", "B4" => "empty",
                    "C1" => "empty", "C2" => "empty", "C3" => "empty", "C4" => "empty",
                    "D1" => "empty", "D2" => "empty", "D3" => "empty", "D4" => "empty"}
  end

  def hit(grid)
    @game_board[grid] = "hit"
  end

  def miss(grid)
    @game_board[grid] = "miss"
  end

  def place_frigate(space1, space2)
    # checks if ship placement exists on the board
    if game_board[space1] == nil || game_board[space2] == nil
      return false
    end
    # checks if ship is longer than 2 spaces horizontally
    if space1[1].to_i - space2[1].to_i > 1 || space2[1].to_i - space1[1].to_i > 1
      return false
    end
    # check if ship is longer than 2 spaces vertically
    if space1[0].ord.to_i - space2[0].ord.to_i > 1 || space2[0].ord - space1[0].ord > 1
      return false
    end

    # if space1[1].to_i -


    game_board[space1] = "occupied"
    game_board[space2] = "occupied"
  end









  # def create_computer_board(ship1, ship2)
  #
  # end


  # def hit(x, y)
  #   create_board[x] = "hit"
  #   create_board[y] = "full"
  #   binding.pry
  # end


end
