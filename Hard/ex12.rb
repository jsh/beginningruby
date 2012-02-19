require 'open-uri'

$: << "."
require 'hello'

"goodbye".hi
[1,2,3].hi

exit

open("http://www.ruby-lang.org/en") do |f|
	#f.each_line {|line| p line}
	puts f.base_uri
	puts f.content_type
	puts "character set: " + f.charset
	p "content encoding: ", f.content_encoding
	puts "last_modified: #{f.last_modified}"
end