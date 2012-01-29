lines = File.readlines("oliver.txt")
puts "#{l=lines.size} lines"

text = lines.join
puts "#{p=text.split(/\n\n/).length} paragraphs"
puts "#{s=text.split(/\.|\?|!/).length} sentences"
puts "#{w=text.split.length} words"

stop_words = %w{the a by on for of are with just but and to my I has some in}
key_words = text.split.select { | word | !stop_words.include?(word) }
puts "#{key_words.length} key words (excluding stop words)"

puts "#{c=text.length} characters"
puts "#{nsc=text.gsub(/\s+/, '').length} characters (excluding spaces)"

puts "\nAverages:\n"
puts "#{s/p} sentences per paragraph"
puts "#{w/s} words per sentence"
puts"#{w/l} words per line"
puts "#{nsc/w} characters per word"
puts "percentage of non-stop-words to all words: #{((key_words.length.to_f/w.to_f) * 100).to_i}"

