require "minitest/autorun"
require_relative "hiddenword.rb"


class HiddenwordTest < Minitest::Test

  def setup
    @word = Hiddenword.new('lake')
  end

  def test_has_a_word
    assert_equal("lake",@word.word)
  end

  def test_is_letter_correct
    assert_equal(true,@word.is_letter_correct("l"))
  end

  def test_if_displays_correct_letters()
    @word.is_letter_correct("l")
    assert_equal("l***",@word.display())
  end


end
