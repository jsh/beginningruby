name = 'Jeffrey S. Haemer'
age = 63 # not a lie
height = 72 # inches
weight = 160 # lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Blond'
height_in_centimeters = 2.54 * height
weight_in_kilos = 0.45359237 * weight

puts "Let's talk about %s." % name
puts "He's %d inches tall." % height
puts "He's %d pounds heavy." % weight
puts "Actually, that's not too heavy."
puts "Metric, that's %d centimeters and %d kilos." % [height_in_centimeters, weight_in_kilos]
puts "He's got %s eyes and %s hair." % [eyes, hair]
puts "His teeth are usually %s, depending on the coffee." % teeth

# this line is tricky, try to get it exactly right.

puts "if I add %d, %d, and %d, I get %d." %
  [age, height, weight,
  age + height + weight]
  