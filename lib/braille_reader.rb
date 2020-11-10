require_relative './dictionary'

class BrailleReader
  include Dictionary 
  attr_reader :braille
              
  
  def initialize(braille)
    @braille = braille.split("\n")
  end

  def organize
    lines = []
    @braille.each_slice(3) do |line|
        while !line[0].empty? do 
              @braille.each do |line|
            lines << line.slice!(0..1)
          end
        end
      end
      result = []
    lines.each_slice(3) do |letters|
      result << letters.join
    end
    result.pop
    result
  end
end