require_relative './dictionary'

class BrailleReader
  include Dictionary 
  attr_reader :braille,
              :english 
  
  def initialize(braille, english)
    @braille = braille
    @english = english
  end

  def write_file
    text = './braille2.txt'
    braille_message = File.open(text, "r")
    incoming_braille = braille_message.read
    english = File.open(ARGV[1], "w")
    english.write(braille_message)
    english.close 
  end
end