require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/braille_reader'

class BrailleReaderTest < Minitest::Test
  def setup
    text = './braille2.txt'
    braille_message = File.open(text, "r")
    incoming_braille = braille_message.read
    english = File.open(ARGV[1], "w")
    english.write(braille_message)
    
     
    @braille_reader = BrailleReader.new(incoming_braille, english)
  end

  def test_it_exists_with_attributes
    assert_instance_of BrailleReader, @braille_reader

    text = './braille2.txt'
    braille_message = File.open(text, "r")
    incoming_braille = braille_message.read

    assert_equal incoming_braille, @braille_reader.braille
  end

  def test_it_can_write
    text = './braille2.txt'
    braille_message = File.open(text, "r")
    incoming_braille = braille_message.read
    english = File.open(ARGV[1], "w")
    english.write(braille_message)
    english.close 

    @braille_reader.write_file
    assert File.exist?("./message2.txt")
  end
end