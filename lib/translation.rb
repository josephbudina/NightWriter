class Translation 
  attr_reader :text 

  def initialize(text)
    @text = text 
  end

  def alphabet
    dictionary = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."],
      "!" => ["..", "00", "0."],
      "'" => ["..", "..", "0."],
      "," => ["..", "0.", ".."],
      "-" => ["..", "..", "00"],
      "." => ["..", "00", ".0"],
      "?" => ["..", "0.", "00"],
      "0" => [".0", "00", ".."],
      "1" => ["0.", "..", ".."],
      "2" => ["0.", "0.", ".."],
      "3" => ["00", "..", ".."],
      "4" => ["00", ".0", ".."],
      "5" => ["0.", ".0", ".."],
      "6" => ["00", "0.", ".."],
      "7" => ["00", "00", ".."],
      "8" => ["0.", "00", ".."],
      "9" => [".0", "0.", ".."]
    }
  end

  def translate(text)
    text.chars.flat_map do |letter|
      alphabet[letter]
    end
  end
  
  def render_text(text)
    translate(text).each_slice(40).to_a.flatten
  end

  #translate from bralle to english as well
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
    translate_words(text).map do |letter|
      top << letter[0]
      middle << letter[1]
      bottom << letter[2]
      lines = top + ["\n"] + middle+ ["\n"] + bottom
    end
    lines.join
  end
end