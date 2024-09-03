require_relative 'lib/board'
require_relative 'lib/player'

class PlayerOne < Player
  def initialize(name)
    super
    @mark = 'X'
  end
end

class PlayerTwo < Player
  def initialize(name)
    super
    @mark = 'O'
  end
end

# Generate Board to play
Board.generate

def win_tiles
  tiles = [
  [[1,1], [1,2], [1,3]],
  [[2,1], [2,2], [2,3]],
  [[3,1], [3,2], [3,3]],

  [[1,1], [2,1], [3,1]],
  [[2,1], [2,2], [2,3]],
  [[1,3], [2,3], [3,3]],
  
  [[1,1], [2,2], [3,3]],
  [[1,3], [2,2], [3,1]]
]
end

def check_has_tiles?(win=win_tiles, player)
  win.each do |x|
    correct_tiles = 0
    player.tiles.each do |y|
      correct_tiles+=1 if x.include?(y)
      return true if correct_tiles == 3
    end
  end
end

def game
  player_one = PlayerOne.new('Player One')
  player_two = PlayerTwo.new('Player Two')

  tiles = []
  win = false
  turn = false

  while win != true
    puts "It's #{player_one.name}'s turn now!" if turn == false
    puts "It's #{player_two.name}'s turn now!" if turn == true
    Board.print
    puts 'Which row? '
    row =  gets.chomp.to_i
    puts  'Which column?'
    col =  gets.chomp.to_i

    if (row < 4 && row > 0) && (col < 4 && col > 0)
      if turn == false
        player_one.add_mark(row, col)
        player_one.tiles.push([row, col])
        check_has_tiles?(player_one) if player_one.tiles.length >= 3
        win = true if check_has_tiles?(player_one) == true
        puts "#{player_one.name} wins!" if check_has_tiles?(player_one) == true
        turn = true
      else
        player_two.add_mark(row, col)
        player_two.tiles.push([row, col])
        check_has_tiles?(player_two) if player_two.tiles.length >= 3
        win = true if check_has_tiles?(player_two) == true
        puts "#{player_two.name} wins!" if check_has_tiles?(player_two) == true
        turn = false
      end
    else
      puts "Can't enter "
    end
    tiles.push(row, col)
  end
end

game

def test(win=win_tiles, arr)
  win.each do |x|
    correct_tiles = 0
    arr.each do |y|
      correct_tiles+=1 if x.include?(y)
      correct_tiles
      return true if correct_tiles == 3
    end
  end
end

arr = [[1,1],[2,2],[3,3]]

# p test(arr)

                                                                                                                                                                                                                                                                                                                                          

def test2
  arr = [[1,2], [1,3], [1,2]]
  hash = arr.tally
  hash.each  { |key, value| arr.uniq! if value > 1 }
  p arr
end
