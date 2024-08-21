class Player
  attr_reader :mark
  attr_accessor :score

  def add_mark (row, col, mark = self.mark) # default argument of mark is either p1's or p2's mark
    Board.modify_board(row, col, mark) # board doesn't need to check whether its p1 or p2
  end

  # below are for debugging I think

  def what_is_self?
    puts "#{self.class.name}" # Prints out Class Name
  end

  def what_mark
    p self.mark
  end

  def what_is_my_name
    p self.name
  end
  
  def what_mark
    p self.mark
  end

  def add_score
    self.score += 1
  end

  def print_score
    p self.score
  end
end