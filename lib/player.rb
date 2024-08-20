class Player
  attr_accessor :name

  def  initialize(name)
    @name = name
  end

  def what_is_self?
    puts "#{self.class.name}" # Prints out Class Name
  end
end