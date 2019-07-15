require './lib/game_sequence'
require './lib/messages'
require 'colorize'
class GameMenu
  include Messages

  def initialize
    game_start
  end

  def game_start
    puts start_message
    player_input = gets.chomp
    if player_input == "p" || player_input == "play"
      start_game
    elsif player_input == "i" || player_input == "instructions"
      instruction_message
      game_start
    elsif player_input == "q" || player_input =="quit"
      quit_game
    else
      invalid_input_message
      game_start
    end
  end

  def start_game
    GameSequence.new
  end

  def quit_game
    quit_message
    exit
  end
end
