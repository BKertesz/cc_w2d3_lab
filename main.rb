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
      clear_screen()
      puts "Lifes left:#{@game.player.lifes_left}"
      puts "Tries:#{@game.guessed_letters}"
      puts "The word: #{@game.hidden_word.display}"
      guess_round()
    end
    puts "You won #{@game.player.name}!" if @game.is_won?
    puts "You lost, #{@game.player.name}. The word was:#{@game.hidden_word.word}" if @game.is_lost?
    start_new_round?()
  end

  def setup_game_loop()
    clear_screen()
    setup_hidden_word()
    setup_player()
    setup_game()
    run_game_loop()
  end

  def start_new_round?()
    puts "Play again? [y/n]"
    choice = gets.chomp.downcase
    setup_game_loop() if choice == "y"
    if choice =="n"
      puts "Good bye!"
    else
      puts "Wrong input!"
      start_new_round?()
    end
  end



end

window = GameLoop.new()
window.setup_game_loop()




# EOF
