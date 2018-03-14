class Game
  attr_reader :player, :hidden_word, :guessed_letters
  def initialize(player,hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def guess_a_letter(letter)
    if @hidden_word.is_letter_correct?(letter)
      return nil
    else
      @guessed_letters << letter
      return @player.remove_life()
    end
  end


end
