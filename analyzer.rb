lines = File.readlines("oliver.txt")
puts "#{l=lines.size} lines"

text = lines.join
puts "#{p=text.split(/\n\n/).length} paragraphs"
puts "#{s=text.split(/\.|\?|!/).length} sentences"
puts "#{w=text.split.length} words"
puts "#{c=text.length} characters"
puts "#{nsc=text.gsub(/\s+/, '').length} characters (excluding spaces)"

puts "\nAverages:\n"
puts "#{s/p} sentences per paragraph"
puts "#{w/s} words per sentence"
puts"#{w/l} words per line"
puts "#{nsc/w} characters per word"