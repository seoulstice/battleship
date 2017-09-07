class Board
  attr_accessor :board
  def initialize
    @board = {"A1" => {:occupied => false, :shot_at => false, :symbol => "\u{1F30A}"},
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
end
