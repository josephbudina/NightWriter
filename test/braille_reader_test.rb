require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/braille_reader'

class BrailleReaderTest < Minitest::Test
  def setup
    text = './braille.txt'
    message = File.open(text, "r")
    incoming_message = message.read
    @braille_reader = BrailleReader.new(incoming_message)
  end

  def test_it_exists_with_attributes
    assert_instance_of BrailleReader, @braille_reader

    text = './braille.txt'
    braille_message = File.open(text, "r")
    incoming_braille = braille_message.read
    
    expected = ["0.0.0.0.0....00.0.0.00","00.00.0..0..00.0000..0","....0.0.0....00.0.0..."]
    
    assert_equal expected, @braille_reader.braille
  end

  def test_organize
    expected = ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0."]
    
    assert_equal expected, @braille_reader.organize
  end
end