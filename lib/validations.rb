module Validations

  def determine_target_occupation_status(target, opponent_board)
    if opponent_board.board[target][:occupied] == true
      true
    else
      false
    end
  end

  def determine_target_previously_shot_at(input, opponent_board)
    if opponent_board.board[input][:shot_at] == true
      true
    else
      false
    end
  end

  def ship_placement_validation
    comparison = destroyer & battleship
    comparison.empty?
  end
end
