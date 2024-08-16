require_relative "lib/board"
require_relative "lib/player"

class Player_One < Player
  @@score = 0
  def add_score
    @@score += 1
  end
end

class Player_Two < Player
  @@score = 0
  def add_score
    @@score += 1
  end
end

player_one = Player_One.new("Nicholas")

player_two = Player_Two.new("PP")
