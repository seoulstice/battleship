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
    @start = Time.now
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
    computer_board_message
    board_graphic_output_message(computer)
    @player_shot_count += 1
    check_rounds_on_target_against_opponent_destroyer(player, computer)
    check_rounds_on_target_against_opponent_battleship(player, computer)
    check_game_over_for_player(player)
    computer_turn_message
    computer.firing_sequence(player.board)
    user_board_message
    board_graphic_output_message(player)
    @computer_shot_count += 1
    check_rounds_on_target_against_opponent_destroyer(computer, player)
    check_rounds_on_target_against_opponent_battleship(computer, player)
    check_game_over_for_computer(computer)
  end

  def check_game_over_for_player(user)
    gameplay_time = Time.now - @start
    if user.rounds_on_target.length == 5
      player_win_message(gameplay_time, player_shot_count)
      exit
    end
  end

  def check_game_over_for_computer(user)
    gameplay_time = Time.now - @start
    if user.rounds_on_target.length == 5
      computer_win_message(gameplay_time, computer_shot_count )
      exit
    end
  end

  def check_rounds_on_target_against_opponent_destroyer(player, opponent)
    shared = opponent.destroyer & player.rounds_on_target
    if shared.length == 2
      destroyer_sunk_message
    end
  end

  def check_rounds_on_target_against_opponent_battleship(player, opponent)
    shared = opponent.battleship & player.rounds_on_target
    if shared.length == 3
      battleship_sunk_message
    end
  end

end
