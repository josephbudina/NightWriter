require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/braille_reader'

class BrailleReaderTest < Minitest::Test
  def setup
    text = './message.txt'
    message = File.open(text, "r")
    incoming_message = message.read
    @braille_writer = BrailleReader.new(incoming_message)
  end

  def test_it_exists_with_attributes
    assert_instance_of BrailleWriter, @braille_Writer
  end