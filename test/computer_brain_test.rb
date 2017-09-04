require 'minitest/autorun'
require 'minitest/emoji'
require './lib/computer_brain'

class ComputerAITest < Minitest::Test

  def test_computer_brain_exists
    brain = ComputerAI.new
binding.pry
    assert_instance_of ComputerAI, brain
  end

  def test_it_can_choose_first_coord
    skip
    cb = ComputerAI.new

    assert cb.choose_first_coord


  end




end
