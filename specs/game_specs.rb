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

  def test_if_can_guess_a_letter
    @game.guess_a_letter("a")
    assert_equal(1,@game.guessed_letters.length)
  end

  def test_if_player_is_losing_lives
    @game.guess_a_letter("x")
    assert_equal(9,@game.player.lifes_left)
  end

  def test_game_is_won?
    @game.guess_a_letter("a")
    @game.guess_a_letter("p")
    @game.guess_a_letter("l")
    @game.guess_a_letter("e")
    assert_equal(true,@game.is_won?)
  end

  def test_game_is_lost?
    10.times{@game.player.remove_life}
    assert_equal(true,@game.is_lost?)
  end

end
# EOF
