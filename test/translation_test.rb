require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/translation'

class TranslationTest < Minitest::Test
  def setup
    text = './message.txt'
    message = File.open(text, "r")
    incoming_message = message.read
    @translation = Translation.new(incoming_message)
  end

  def test_it_exists_with_attributes
    assert_instance_of Translation, @translation
  end
  
  def test_alphabet
  expected = ["0.", "..", ".."]
  expected2 = [".0", "00", ".0"] 
  expected3 = ["..", "0.", ".."]

  assert_equal expected, @translation.alphabet["a"]
  assert_equal expected2, @translation.alphabet["w"]
  assert_equal expected3, @translation.alphabet[","]

  end

  def test_translate
    assert_equal ["00", "..", ".."], @translation.translate("c")
    assert_equal [".0", "00", ".0"], @translation.translate("w")
  end

  def test_render_words
    expected = [["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0."]]

    assert_equal expected, @translation.render_text("hello")
  end

  def test_translate_words
    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], ["..", "..", ".."], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."]]
    
    assert_equal expected, @translation.translate_words("hello world")
  end

  def test_group_braille
    expected = "0.0.0.0.0....00.0.0.00\n" +  
                "00.00.0..0..00.0000..0\n" +
                "....0.0.0....00.0.0..."

    assert_equal expected, @translation.group_braille("hello world")
  end
end