require "minitest/autorun"
require_relative "../player"

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new("Bob",10)
  end

  def test_if_has_name
    assert_equal("Bob",@player.name)
  end

  def test_if_has_lifes
    assert_equal(10,@player.lifes_left)
  end

  def test_remove_a_life
    assert_equal(9,@player.remove_life)
  end
end
# EOF
