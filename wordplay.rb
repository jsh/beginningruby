class WordPlay
	$: << '.'
	require 'wp_string'
	
	# pick the sentence with the highest number of desired words
	def self.best_sentence(sentences, desired_words)
		ranked_sentences = sentences.sort_by do |s|
			s.words.length - (s.downcase.words - desired_words).length
		end
		ranked_sentences.last
	end
	
	def self.switch_pronouns(text)
		t = text.gsub(/\b(I am|You are|I|you|me|my|mine|your|yours)\b/i) do |pronoun|
			case pronoun.downcase
				when "i am"
					"you are"
				when "you are"
					"i am"
				when "i"
					"you"
				when "you"
					"me"
				when "me"
					"you"
				when "my"
					"your"
				when "mine"
					"yours"
				when "your"
					"my"
				when "yours"
					"mine"
			end
		end.sub(/^me\b/, "i")
	end
end
