require_relative './braille_writer'

message = File.open(ARGV[0], "r")

incoming_message = message.read

braille_text = BrailleWriter.new(incoming_message)

translated = braille_text.render_text(incoming_message)

message.close

braile_writer = File.open(ARGV[1], "w")

braile_writer.write(translated)

braile_writer.close 

puts "Created #{ARGV[1]} containing #{incoming_message.length} characters"
