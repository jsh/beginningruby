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
	
end
