require_relative './dictionary'

class BrailleReader
  include Dictionary 
  attr_reader :braille
              
  
  def initialize(braille)
    @braille = braille
  end

  # def organize
  #   lines = []
  #   @braille
  #   end
  # end
end