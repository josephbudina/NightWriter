message = File.open(ARGV[0], "r")
incoming = message.readlines
incoming_count = incoming.size 
incoming_text = incoming.join 
incoming_total_characters = incoming_text.length

message.close

braille_text = incoming

braile_writer = File.open(ARGV[1], "w")

braile_writer.write(braille_text)

braile_writer.close 

puts "Created 'braille.txt' containing #{incoming_total_characters} characters"
