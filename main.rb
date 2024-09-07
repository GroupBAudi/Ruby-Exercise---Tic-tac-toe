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

class Game
  attr_reader :player_one, :player_two
  attr_accessor :win, :tiles
  def initialize(p_one, p_two)
    @player_one = p_one
    @player_two = p_two
    @win = false
    @tiles = []
    @turn = false
  end

  def add_tiles(player, row, col)
    if @tiles.include?([row, col])
      puts "Tile's taken. Take another tile."
    else
      player.add_mark(row, col)
      @tiles.push([row, col])
      if !@turn
        @turn = true
      else
        @turn = false
      end
    end
  end

  def check_has_tiles?(player, win = Board.win_tiles)
    win.each do |x|
      correct_tiles = 0
      player.tiles.each do |y|
        correct_tiles +=1 if x.include?(y)
        return true if correct_tiles == 3
      end
    end
  end

  def start_game
    Board.generate
    until self.win
      puts "It's #{player_one.name}'s turn now!" if @turn == false
      puts "It's #{player_two.name}'s turn now!" if @turn == true
      Board.print
      puts 'Which row?'
      row = gets.chomp.to_i
      puts 'Which column?'
      col = gets.chomp.to_i
      if (row < 4 && row > 0) && (col < 4 && col > 0)
        if !@turn
          add_tiles(player_one, row, col)
        else
          add_tiles(player_two, row, col)
        end
      end
      if player_one.tiles.length >= 3
        puts "#{player_one.name} wins" if check_has_tiles?(player_one) == true
        puts "#{player_two.name} wins" if check_has_tiles?(player_two) == true
        self.win = true if check_has_tiles?(player_one) == true || check_has_tiles?(player_two) == true
      end
    end
  end
end

player_one = PlayerOne.new('Player One')
player_two = PlayerTwo.new('Player Two')

game = Game.new(player_one, player_two)
game.start_game