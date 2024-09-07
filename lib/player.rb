class Player
  attr_reader :mark, :name
  attr_accessor :score, :tiles

  def initialize(name)
    @name = name
    @score = 0
    @tiles = []
  end

  def add_mark (row, col, mark = self.mark) # default argument of mark is either p1's or p2's mark
    Board.modify_board(row, col, mark)
  end
end