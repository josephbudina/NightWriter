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
  
  def render_text(text)
    translate(text).each_slice(40).to_a.flatten
  end

  def translate_words(text)
    letters = []
    render_text(text).each_slice(3) do |letter|
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