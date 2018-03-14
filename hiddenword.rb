class Hiddenword
  attr_reader :word, :correct_letters

  def initialize(word)
    @word = word
    @correct_letters = []
  end


  def is_letter_correct?(a_character)
    char = a_character.downcase
    if @word.split("").include?(char)
      @correct_letters << char
      return true
    end
    return false
  end


  def display()
    display_word = String.new()
    for letter in @word.split("")
      if letter == " "
        display_word << " "
      elsif @correct_letters.include?(letter)
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
