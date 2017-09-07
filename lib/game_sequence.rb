require './lib/player'
require './lib/computer_ai'
require './lib/board'
require './lib/messages'
class GameSequence
  include Messages
    attr_reader :computer,
                :player,
                :board,
                :player_shot_count,
                :computer_shot_count

  def initialize
    @opponent_destroyer = []
    @opponent_battleship = []
    @computer = ComputerAI.new
    @player = Player.new
    @board = Board.new
    @player_shot_count = 0
    @computer_shot_count = 0
    game_sequence
  end

  def game_sequence
    placement_of_ships
    until player.rounds_on_target == 5 || computer.rounds_on_target == 5
      shot_sequence(player, computer)
    end
  end

  def placement_of_ships
    computer.create_ships
    computer.place_ships_on_board
    puts computer_ship_placement_complete_message
    player.create_ships
    player.place_ships_on_board
  end

  def shot_sequence(player, computer)
    player.firing_sequence(computer.board)
    @player_shot_count += 1
    check_game_over_for_player(player)
    #check which ship sunk
    computer_turn_message
    computer.firing_sequence(player.board)
    @computer_shot_count += 1
    check_game_over_for_computer(computer)
    #check which ship sunk
  end

  def check_game_over_for_player(user)
    if user.rounds_on_target.length == 5
      player_win_message
      exit
    end
  end

  def check_game_over_for_computer(user)
    if user.rounds_on_target.length == 5
      computer_win_message
      exit
    end
  end

  # def check_if_destroyer_sunk(opponent)
  #   opponent.destroyer.each do |coord|
  #     opponent_destroyer << coord
  #   end
  #   if opponent_destroyer.sort == opponent.
  #
  # end

end
