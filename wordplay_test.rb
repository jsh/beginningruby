$: << '.'
require 'test/unit'
require 'wordplay'

class TestWordPlay < Test::Unit::TestCase
	
	def test_basic
		s1 = %q(
		Hello, world. You can see this is a test!  What do you think of that?
		)
		# simple test
		assert_equal( "Hello, world", WordPlay.best_sentence(s1.sentences, ["hello"]) )
		# case-insensitivity
		assert_equal( "What do you think of that", WordPlay.best_sentence(s1.sentences, ["what"]) )
		# two sentences share an important word, only one has two
		assert_equal( "You can see this is a test", WordPlay.best_sentence(s1.sentences, ["you", "can"]) )
		# some sentences have some, important words others have others
		assert_equal( "What do you think of that", WordPlay.best_sentence(s1.sentences, ["this", "what", "do", "hello"]) )
	end
end