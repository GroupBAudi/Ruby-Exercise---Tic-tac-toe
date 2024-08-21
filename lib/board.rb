class Board
  @@board = []
  def self.generate
    row = []
    for i in 1..9 do
      row.push(i.to_s)
      if (i % 3).zero?
        @@board.push(row)
        row = []
      end
    end
  end

  def self.print
    @@board.each { |r| p r } # prints the board
  end

  def self.modify_board(row, col, mark)
    @@board[row - 1][col - 1] = mark
    # p "#{mark}"
  end
end
