require 'minitest/autorun'
require './lib/computer_ai'
require './lib/player'
require './lib/ship_coordinates'

class ComputerAITest < Minitest::Test
  include ShipCoordinates
  def test_computer_brain_exists
    brain = ComputerAI.new

    assert_instance_of ComputerAI, brain
  end

  def test_brain_can_choose_first_coordinate
    brain = ComputerAI.new

    assert ship_first_space.include?(brain.first_coordinate)
  end

  def test_brain_can_choose_second_coordinate
    brain = ComputerAI.new
    key = brain.first_coordinate

    assert ship_second_space[key].include?(brain.second_coordinate(key))
  end

  def test_brain_can_choose_third_coordinate
    brain = ComputerAI.new
    first_key = brain.first_coordinate
    second_key = brain.second_coordinate(first_key)
    final_key = []
    final_key << first_key << second_key
    final_key = final_key.sort

    assert ship_third_space[final_key].include?(brain.third_coordinate(final_key))
  end

  def test_brain_can_create_destroyer
    brain = ComputerAI.new
    brain.create_destroyer

    assert_equal 2, brain.destroyer.length
  end

  def test_brain_can_create_submarine
    brain = ComputerAI.new
    brain.create_battleship

    assert_equal 3, brain.battleship.length
  end

  def test_brain_can_validate_both_ships_do_not_overlap
    brain = ComputerAI.new
    brain.create_destroyer
    brain.create_battleship
    combination = brain.destroyer & brain.battleship

    if combination.empty?
      assert brain.ship_placement_validation
    else
      refute brain.ship_placement_validation
    end
  end

  def test_brain_can_create_ships
    brain = ComputerAI.new
    brain.create_ships

    assert brain.ship_placement_validation
    assert_equal 2, brain.destroyer.length
    assert_equal 3, brain.battleship.length
  end

  def test_brain_can_choose_target
    brain = ComputerAI.new
    player = Player.new
    random_coord = brain.choose_target(player.board)

    assert player.board.board.keys.include?(random_coord)
  end

  def test_brain_can_fire
    skip "Skipped because sends game message"
    brain = ComputerAI.new
    player = Player.new
    brain.firing_sequence(player.board)

    assert player.board.board.values[:shot_at].include?(true)
  end


end
