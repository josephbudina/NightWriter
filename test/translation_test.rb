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

  assert_equal expected, @translation.alphabet["a"]
  end

  def test_translate
    assert_equal ["00", "..", ".."], @translation.translate("c")
  end
end