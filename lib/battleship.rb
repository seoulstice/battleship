require './lib/messages'
require './lib/gameboard'
require './lib/computer'
require 'pry'

class Battleship

include Message

  attr_reader

  def initialize
    start_menu_user_input

  end

  def start_menu_user_input
    start_message
    start_input = gets.chomp.downcase
    if start_input == "p" || start_input =="play"
      start_game
    elsif start_input == "i" || start_input =="instructions"
      instruction_message
      start_menu_user_input
    elsif start_input == "q" || start_input == "quit"
      exit
    else
      puts "Invalid input, try again."
      start_menu_user_input
    end

  end

  def start_game
    start_game_message
    @computer = Computer.new

  end

end

bs = Battleship.new
bs.start_menu_user_input
