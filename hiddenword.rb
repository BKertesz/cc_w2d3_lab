class Hiddenword
  attr_reader :word, :correct_letters

  def initialize(word)
    @word = word
    @correct_letters = []
  end


  def is_letter_correct?(a_character)
    if @word.split("").include?(a_character)
      @correct_letters << a_character
      return true
    end
    return false
  end


  def display()
    display_word = String.new()
    for letter in @word.split("")
      if @correct_letters.include?(letter)
        display_word << letter
      else
        display_word << "*"
      end
    end
    return display_word
  end


end

# test_word = Hiddenword.new("todd")
# p test_word.is_letter_correct?("o")
# # p test_word.is_letter_correct?("t")
# # p test_word.is_letter_correct?("d")
# p test_word.display()

# EOF
