$: << '.'
require 'test/unit'
require 'wordplay'

class TestWordPlay < Test::Unit::TestCase
	@@sentences = ["foo", "bar"]
	
	def test_basic
		assert_equal("This is a test", WordPlay.best_sentence(@@sentences, "hello"))
	end
end