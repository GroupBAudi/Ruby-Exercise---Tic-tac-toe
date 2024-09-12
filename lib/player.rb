class Player
  attr_reader :mark, :name
  attr_accessor :score, :tiles, :win, :correct_tiles

  def initialize(name)
    @name = name
    @score = 0
    @tiles = []
    @win = false
    @correct_tiles = 0
  end

  def add_mark (row, col, mark = self.mark) # default argument of mark is either p1's or p2's mark
    self.tiles.push([row, col])
    Board.modify_board(row, col, mark)
  end
end