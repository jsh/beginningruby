days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug\n"

puts "Here are the days: ", days
puts "Here are the months: ", months

puts <<'PARAGRAPH'
There's something going on here
With the PARAGRAPH thing.
#{days}
PARAGRAPH

puts "Hello"