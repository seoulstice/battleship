require './lib/board'
require './lib/ship_coordinates'

class Player
  attr_accessor :board

  def initialize
    @board = Board.new

  end

  

end
