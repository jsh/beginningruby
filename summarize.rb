text = %q{Ruby is a great programming language.  It is object-oriented and has many groovy features.  Some people don't like it
but that's not our problem!  It's easy to learn. It's great.  To learn more about Ruby,
visit the official website today.}

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sorted_sentences = sentences.sort_by { | sentence | sentence.length }
one_third = sentences.length/3
interesting_sentences = sorted_sentences.slice(one_third, one_third+1)
interesting_sentences = interesting_sentences.select { |sentence| sentence =~ / (is|are) / }
print interesting_sentences.join(". "), ".\n"