require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/braille_writer'

class BrailleWriterTest < Minitest::Test
  def setup
    text = './message.txt'
    message = File.open(text, "r")
    incoming_message = message.read
    @braille_writer = BrailleWriter.new(incoming_message)
  end

  def test_it_exists_with_attributes
    assert_instance_of BrailleWriter, @braille_writer
  end
  
  def test_alphabet
  expected = ["0.", "..", ".."]
  expected2 = [".0", "00", ".0"] 
  expected3 = ["..", "0.", ".."]

  assert_equal expected, @braille_writer.alphabet["a"]
  assert_equal expected2, @braille_writer.alphabet["w"]
  assert_equal expected3, @braille_writer.alphabet[","]

  end

  def test_translate
    assert_equal ["00", "..", ".."], @braille_writer.translate("c")
    assert_equal [".0", "00", ".0"], @braille_writer.translate("w")
  end

  def test_render_words
    expected = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0."]

    assert_equal expected, @braille_writer.render_text("hello")
  end

  def test_translate_words
    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], ["..", "..", ".."], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."]]
    
    assert_equal expected, @braille_writer.translate_words("hello world")
  end

  def test_group_braille
    expected =  "0.0.0.0.0....00.0.0.00\n" + 
                "00.00.0..0..00.0000..0\n" +
                "....0.0.0....00.0.0..."

    assert_equal expected, @braille_writer.group_braille("hello world")
  end
end