require "minitest/autorun"
require_relative "../game"
require_relative "../player"
require_relative "../hiddenword"

class GameTest < Minitest::Test
  def setup
    @word = Hiddenword.new("apple")
    @player = Player.new("Jake",10)
    @game = Game.new(@player,@word)
  end

  def test_has_player
    assert_equal("Jake",@game.player.name)
  end

  def test_has_word
    assert_equal("apple",@game.hidden_word.word)
  end

  def test_guessed_letter_is_zero
    assert_equal(0,@game.guessed_letters.length)
  end

end
# EOF
