require './lib/messages'
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
    if start_input == "p"
      start_game
    elsif start_input == "i"
      instruction_message
    elsif start_input == "q"
      exit
    else
      puts "Invalid input, try again."
      start_menu_user_input
    end

  end

  def start_game

  end

end

bs = Battleship.new
bs.start_menu_user_input
