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
      puts Rainbow("Tile's taken. Take another tile.").red
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

  def reset_board
    Board.clear
    @tiles = []
    player_one.clear_taken_tiles
    player_two.clear_taken_tiles
    player_one.correct_tiles = 0
    player_two.correct_tiles = 0
    @turn = false # change the turn back to player one
  end

  def add_score
    if player_one.win == true
      player_one.score += 1
      player_one.win = false
    elsif player_two.win == true
      player_two.score += 1
      player_two.win = false
    end
  end

  def restart_game
    add_score
    puts "#{Rainbow(player_one.name).red}'s score = #{player_one.score}"
    puts "#{Rainbow(player_two.name).blue}'s score = #{player_two.score}"
    reset_board
    start_game
  end

  def exit_game
    add_score
    puts "Thank you for playing!"
    puts "#{Rainbow(player_one.name).red}'s score = #{player_one.score}"
    puts "#{Rainbow(player_two.name).blue}'s score = #{player_two.score}"
  end

  def start_game
    Board.generate
    until player_one.win || player_two.win
      puts "It's #{Rainbow(player_one.name).red}'s turn now!" if @turn == false
      puts "It's #{Rainbow(player_two.name).blue}'s turn now!" if @turn == true
      Board.print_self
      puts 'Which tile?'
      i = gets.chomp.to_i
      if i > 9 || i <= 0
        puts "Oops! Out of range."
      else
        if !@turn
          take_tile(player_one, i)
        else
          take_tile(player_two, i)
        end
      end
      check_has_tiles?(player_one)
      check_has_tiles?(player_two) 
   
      puts "#{player_one.name} wins!" if player_one.win == true
      puts "#{player_two.name} wins!" if player_two.win == true

      if self.tiles.length == 9 && (!player_one.win && !player_two.win) 
        Board.print_self
        puts "No possible tiles left! Restart the game? (y/n)"
        reset_board_prompt = gets.chomp
        reset_board if reset_board_prompt == "y"
        Board.generate
      end
    end
    puts "Game has ended! Restart? (y/n lowercase only)"
    restart_game_prompt = gets.chomp
    if restart_game_prompt == "y" then restart_game else exit_game end
  end
end

player_one = PlayerOne.new('Player One')
player_two = PlayerTwo.new('Player Two')

game = Game.new(player_one, player_two)
game.start_game