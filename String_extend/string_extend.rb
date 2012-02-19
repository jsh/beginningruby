class String
	# split a string into an array of sentences, without the sentence terminators
	def sentences
		gsub(/(\n|\r)/, '').gsub(/\s+/, ' ').gsub(/\A\s*/, '').split(/[\.\!\?]+\s*/)
	end

	# split a string into an array of words
	def words
		scan(/\w[\w\-\']*/)
	end

	# find the vowels in a string
	def vowels
		scan(/aeiou/i)
	end
end
