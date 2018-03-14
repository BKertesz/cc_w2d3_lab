require_relative "game"
require_relative "player"
require_relative "hiddenword"

class GameLoop
  def clear_screen
    print %x{clear}
  end

  def setup_player()
    puts "Hello! What should be your name?"
    player_name = gets.chomp
    puts "How many round would you like to play?"
    lives = gets.chomp
    lives = lives.to_i
    @player = Player.new(player_name,lives)
  end

  def setup_hidden_word()
    puts "What should be the hidden word?"
    word = gets.chomp.downcase
    @hidden_word = Hiddenword.new(word)
    clear_screen()
  end

  def setup_game()
    @game = Game.new(@player,@hidden_word)
  end

def guess_round()
  puts ("Guess a letter:")
  guess = gets.chomp
  if guess.length > 1
    puts "Needs to be one character!"
    guess_round()
  end
  @game.guess_a_letter(guess)

end

  def run_game_loop()
    until @game.is_won? || @game.is_lost?
      puts "Lifes left:#{@game.player.lifes_left}"
      puts "Guessed letters:#{@game.guessed_letters}"
      puts "The word: #{@game.hidden_word.display}"
      guess_round()
    end
    puts "You won #{@game.player.name}!" if @game.is_won?
    puts "You lost #{@game.player.name}, the word was #{@game.hidden_word.word}" if @game.is_lost?
  end
end

window = GameLoop.new()
window.clear_screen()
window.setup_hidden_word()
window.setup_player()
window.setup_game()
window.run_game_loop()



  # EOF
