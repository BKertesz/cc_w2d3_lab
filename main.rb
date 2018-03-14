require_relative "game"
require_relative "player"
require_relative "hiddenword"

clear_code = %x{clear}
def setup_player()
  print "Hello! What should be your name?"
  player_name = gets.chomp
  print "How many round would you like to play?"
  lives = gets.chomp
  lives = lives.to_i
  player = Player.new(player_name,lives)
end

def setup_hidden_word()
  print "What should be the hidden word?"
  word = gets.chomp
  hidden_word = Hiddenword.new(word)
  print clear_code
end

def setup_game()
  game = Game.new(player,hidden_word)
end

def run_game_loop()
  while game.is_won? && game.is_lost?

  end

end



# EOF
