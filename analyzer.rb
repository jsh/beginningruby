lines = File.readlines("oliver.txt")
puts "#{lines.size} lines"

text = lines.join
puts "#{text.split(/\n\n/).length} paragraphs"
puts "#{text.split(/\.|\?|!/).length} sentences"
puts "#{text.split.length} words"
puts "#{text.length} characters"
puts "#{text.gsub(/\s+/, '').length} characters (excluding spaces)"
