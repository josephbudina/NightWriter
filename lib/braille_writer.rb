require_relative './dictionary'

class BrailleWriter
  include Dictionary 
  attr_reader :text 

  def initialize(text)
    @text = text 
  end

  def translate(text)
    text.chars.flat_map do |letter|
      alphabet[letter]
    end
  end
  

  def translate_words(text)
    letters = []
    translate(text).each_slice(3) do |letter|
       letters << letter
    end
    letters
  end

  def group_braille(text)
    top = []
    middle = []
    bottom = []
    lines = []
    translate_words(text).each do |letter|
      top << letter[0]
      middle << letter[1]
      bottom << letter[2]
      lines = top + ["\n"] + middle+ ["\n"] + bottom
    end
    lines.join
  end
end