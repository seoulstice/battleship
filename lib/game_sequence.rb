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
                :computer_shot_count,
                :opponent_destroyer,
                :opponent_battleship,
                :computer_destroyer,
                :computer_battleship,
                :start,
                :end

  def initialize
    @human_destroyer = []
    @human_battleship = []
    @computer_destroyer = []
    @computer_battleship = []
    @computer = ComputerAI.new
    @player = Player.new
    @board = Board.new
    @player_shot_count = 0
    @computer_shot_count = 0
    @start = Time.now
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
    computer_board_message
    board_graphic_output_message(computer)
    @player_shot_count += 1
    check_game_over_for_player(player)

    #check which ship sunk
    computer_turn_message
    computer.firing_sequence(player.board)
    user_board_message
    board_graphic_output_message(player)
    @computer_shot_count += 1
    check_game_over_for_computer(computer)

  end

  def check_game_over_for_player(user)
    if user.rounds_on_target.length == 5
      player_win_message
    end
  end

  def check_game_over_for_computer(user)
    if user.rounds_on_target.length == 5
      computer_win_message
      exit
    end
  end

  def check_target_on_opponent_board(opponent, target)
    if opponent.destroyer.include?(target)
      opponent.destroyer.delete(target)
    elsif opponent.battleship.include?(target)
      opponent.battleship.delete(target)
    end
  end

  def check_if_ship_sunk(opponent)
    if opponent.destroyer.length == 0
      destroyer_sunk_message
    elsif opponent.battleship.length == 0
      battleship_sunk_message
    end
  end
end
