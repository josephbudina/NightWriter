require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/braille_reader'

class BrailleReaderTest < Minitest::Test
  def setup
    text = './braille.txt'
    braille_message = File.open(text, "r")
    incoming_braille = braille_message.read
    @braille_reader = BrailleReader.new(incoming_braille)
  end

  def test_it_exists_with_attributes
    assert_instance_of BrailleReader, @braille_reader

    text = './braille.txt'
    braille_message = File.open(text, "r")
    incoming_braille = braille_message.read

    assert_equal incoming_braille, @braille_reader.braille
  end
end