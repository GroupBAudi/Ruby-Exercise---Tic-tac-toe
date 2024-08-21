require_relative "lib/board"
require_relative "lib/player"

# make function called game
# each game consists of turn, starting from player one
# player one takes turn by taking input from 1 to 9, board printed
# player two takes turn by taking input from 1 to 9, board printed, can't change player one mark
# and so on
# win by checking if their mark are three in a row i.e. [X, X, X]

# player one choose tile. i.e. Row 1, tile 3
# Row 1 Tile 3 is now "X"
# player two choose tile. i.e. Row 1, tile 1
# Row 1 Tile 1 is now "O"

class Player_One < Player
  def initialize(name)
    @name = name
    @mark = "X"
    @score = 0
  end
end

class Player_Two < Player
  def initialize(name)
    @name = name
    @mark = "O"
    @score = 0
  end
end

# Generate Board to play
Board.generate
Board.print

one = Player_One.new("Nicholas")
two = Player_Two.new("PP")

# For ease of non user, simply put 1 for first row, 2 for 2nd tile

one.add_score
one.print_score
# one.add_mark(1, 3)
# two.add_mark(1, 2) # works

# Board.print