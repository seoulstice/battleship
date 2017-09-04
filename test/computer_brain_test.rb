require 'minitest/autorun'
require 'minitest/emoji'
require './lib/computer_brain'

class ComputerBrainTest < Minitest::Test

  def test_computer_brain_exists
    cb = ComputerBrain.new
binding.pry
    assert_instance_of ComputerBrain, cb
  end

  def test_it_can_choose_first_coord
    skip
    cb = ComputerBrain.new

    assert cb.choose_first_coord


  end




end
