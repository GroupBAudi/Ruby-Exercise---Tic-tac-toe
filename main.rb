require_relative 'lib/board'
require_relative 'lib/player'
require 'bundler/setup'
require 'rainbow'

class PlayerOne < Player
  def initialize(name)
    super
    @mark = Rainbow('X').red
  end
end

class PlayerTwo < Player
  def initialize(name)
    super
    @mark = Rainbow('O').blue
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

  def take_tile(player, number)
    if @tiles.include?(number)
      puts "Tile's taken. Take another tile."
    else
      player.add_mark(number)
      @tiles.push(number)
      if !@turn then @turn = true else @turn = false end
    end
  end

  def check_has_tiles?(player, win = Board.win_tiles)
    win.each do |x|
      correct_tiles = 0
      player.tiles.each do |y|
        correct_tiles +=1 if x.include?(y)
        player.win = true if correct_tiles == 3
      end
    end
  end

  def reset_game
    Board.clear
    @tiles = []
    player_one.clear_taken_tiles
    player_two.clear_taken_tiles
    @turn = false
    puts "Draw! Game was reset"
  end

  def start_game
    Board.generate
    until player_one.win || player_two.win
      puts "It's #{player_one.name}'s turn now!" if @turn == false
      puts "It's #{player_two.name}'s turn now!" if @turn == true
      Board.print_self
      puts 'Which tile?'
      i = gets.chomp.to_i
      if !@turn
        take_tile(player_one, i)
      else
        take_tile(player_two, i)
      end
      
      check_has_tiles?(player_one)
      check_has_tiles?(player_two) 
   
      puts "#{player_one.name} wins!" if player_one.win == true
      puts "#{player_two.name} wins!" if player_two.win == true
      reset_game if self.tiles.length > 8
    end
  end
end

player_one = PlayerOne.new('Player One')
player_two = PlayerTwo.new('Player Two')

game = Game.new(player_one, player_two)
game.start_game