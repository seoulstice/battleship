class Board
  attr_accessor :board

  def initialize
    @board =   {"A1" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "A2" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "A3" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "A4" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "B1" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "B2" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "B3" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "B4" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "C1" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "C2" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "C3" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "C4" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "D1" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "D2" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "D3" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
                "D4" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"}}
  end

  def board_output
    top_border    =  "==================="
    numbers       = [".", "  1  ", " 2  ", " 3  ", " 4  "].join
    row_a         = ["A", "  #{@board["A1"][:symbol]} ", "  #{@board["A2"][:symbol]}  ", " #{@board["A3"][:symbol]}  ", " #{@board["A4"][:symbol]}  "].join
    row_b         = ["B", "  #{@board["B1"][:symbol]} ", "  #{@board["B2"][:symbol]}  ", " #{@board["B3"][:symbol]}  ", " #{@board["B4"][:symbol]}  "].join
    row_c         = ["C", "  #{@board["C1"][:symbol]} ", "  #{@board["C2"][:symbol]}  ", " #{@board["C3"][:symbol]}  ", " #{@board["C4"][:symbol]}  "].join
    row_d         = ["D", "  #{@board["D1"][:symbol]} ", "  #{@board["D2"][:symbol]}  ", " #{@board["D3"][:symbol]}  ", " #{@board["D4"][:symbol]}  "].join
    bottom_border = "==================="
    print "\n#{top_border}\n#{numbers}\n#{row_a}\n#{row_b}\n#{row_c}\n#{row_d}\n#{bottom_border}\n\n"
  end
  
end
