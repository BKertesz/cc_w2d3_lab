class Player
  attr_reader :name,:lifes_left
  def initialize(name,lifes)
    @name = name
    @lifes_left = lifes
  end

  def remove_life()
    return @lifes_left -= 1
  end

end
