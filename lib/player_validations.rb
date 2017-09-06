module PlayerValidations

  def determine_if_user_input_is_valid(input, computer_board)
    if computer_board.board.keys.include?(input)
      true
    else
      false
    end
  end

  def first_coordinate_validity(input)
    ship_first_space.include?(input)
  end

  def second_coordinate_validity(input1, input2)
    ship_second_space[input1].include?(input2)
  end

  def third_coordinate_validity(input1, input2, input3)
    key = []
    key << input1 << input2
    ship_third_space[key.sort].include?(input3)
  end
end
