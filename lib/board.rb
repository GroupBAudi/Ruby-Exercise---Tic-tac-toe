class Board
  @@board = []
  def self.generate
    for i in 1..9 do
      @@board.push(i)
    end
  end

  def self.win_tiles
    tiles = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],

    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],

    [1, 5, 9],
    [3, 5, 7]
  ]
  end

  def self.clear
    @@board = []
  end

  def self.print_self
    for i in 1..@@board.length
      print @@board[i - 1]
      print "\n" if i % 3 == 0
    end
  end

  def self.modify_board(number, mark)
    @@board[number - 1] = mark
  end
end