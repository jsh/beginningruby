text = ''
line_count = 0

File.open("oliver.txt").each  do |line|
	line_count += 1
	text << line
end

puts "line count is #{line_count}"