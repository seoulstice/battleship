class Board
  attr_accessor :board

  def initialize
    @board =   {"A1" => {:occupied => false, :shot_at => false, :symbol => " "},
                "A2" => {:occupied => false, :shot_at => false, :symbol => " "},
                "A3" => {:occupied => false, :shot_at => false, :symbol => " "},
                "A4" => {:occupied => false, :shot_at => false, :symbol => " "},
                "B1" => {:occupied => false, :shot_at => false, :symbol => " "},
                "B2" => {:occupied => false, :shot_at => false, :symbol => " "},
                "B3" => {:occupied => false, :shot_at => false, :symbol => " "},
                "B4" => {:occupied => false, :shot_at => false, :symbol => " "},
                "C1" => {:occupied => false, :shot_at => false, :symbol => " "},
                "C2" => {:occupied => false, :shot_at => false, :symbol => " "},
                "C3" => {:occupied => false, :shot_at => false, :symbol => " "},
                "C4" => {:occupied => false, :shot_at => false, :symbol => " "},
                "D1" => {:occupied => false, :shot_at => false, :symbol => " "},
                "D2" => {:occupied => false, :shot_at => false, :symbol => " "},
                "D3" => {:occupied => false, :shot_at => false, :symbol => " "},
                "D4" => {:occupied => false, :shot_at => false, :symbol => " "}}
  end
end
