class Board
  @@board = []
  def self.generate_board
    row = []
    for i in 1..9 do
      row.push(i)
      if (i % 3).zero?
        @@board.push(row)
        row = []
      end
    end
    @@board.each { |r| p r }
  end
end

Board.generate_board