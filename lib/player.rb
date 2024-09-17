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

  def add_mark (number, mark = self.mark) # default argument of mark is either p1's or p2's mark
    self.tiles.push(number)
    Board.modify_board(number, mark)
  end

  def clear_taken_tiles
    self.tiles = []
  end
end