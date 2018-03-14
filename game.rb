class Game
  attr_reader :player, :hidden_word, :guessed_letters
  def initialize(player,hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def is_won?
    if @hidden_word.display == @hidden_word.word
      return true
    end
    return false
  end

  def is_lost?
    return true if @player.lifes_left <= 0
    return false
  end

  def guess_a_letter(letter)
    if @hidden_word.is_letter_correct?(letter)
      return @guessed_letters << letter
    else
      @guessed_letters << letter
      return @player.remove_life()
    end
  end


end
