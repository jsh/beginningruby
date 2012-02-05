$: << '.'
require 'test/unit'
require 'wp_string'


class TestWpString < Test::Unit::TestCase
	@@sentence = "Here's a test.  To-wit: what's it do with these?"
	@@paragraph ="Here's a test of basic sentence splitting.	It even
	works over
	multiple lines!
	What do you think?"
	
	def test_basic
		assert_equal(%w(Here's a test To-wit what's it do with these), @@sentence.words)
		assert_equal([
			"Here's a test of basic sentence splitting",
			"It even works over multiple lines",
			"What do you think"
		], @@paragraph.sentences)
		assert_equal("works", @@paragraph.sentences[1].words[2])
	end
end