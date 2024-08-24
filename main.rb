require_relative "lib/board"
require_relative "lib/player"

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

one = Player_One.new("Nicholas")
two = Player_Two.new("PP")

# make function called game
# each game consists of turn, starting from player one
# player one takes turn by taking input from 1 to 9, board printed
# player two takes turn by taking input from 1 to 9, board printed, can't change player one mark
# and so on
# win by checking if their mark are three in a row i.e. [X, X, X]

one.add_mark(1,2)
two.add_mark(1,3)

# one.print_tiles
two.print_tiles

def game

end


# imagine arr = [[1,2], [1,3], [1,2]]
# if we input some array 'coordinates'. we check it if it has a duplicate coordinates within arr
# if yes, do not modify the board, and give a slap on the wrist
# if no, allow input

# Below removes duplicate coordinates

def test
  arr = [[1,2], [1,3], [1,2]]
  hash = arr.tally
  hash.each  { |key, value| arr.uniq! if value > 1 }
  p arr
end

# test