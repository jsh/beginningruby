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
	
	
		assert_equal( "my cat is fighting with your cat", WordPlay.switch_pronouns('Your cat is fighting with my cat') )
		assert_equal( "your cat is fighting with me", WordPlay.switch_pronouns('My cat is fighting with you') )
		assert_equal( "i am your robot", WordPlay.switch_pronouns('You are my robot') )
		assert_equal( "you gave me hope", WordPlay.switch_pronouns('I gave you hope') )
		
	
	end
		
end