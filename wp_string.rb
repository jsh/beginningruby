class String
	def sentences
		gsub(/\n|\r/, '').gsub(/\s+/, ' ').split(/[\.\!\?]+\s*/)
	end
	def words
		scan(/\w[\w\-\']*/)
	end
end
