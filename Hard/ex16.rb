$stdout.sync = true

ARGV << "foo.txt"
filename = ARGV.first
p ARGV

script = $0

puts "We're going to erase #{filename}."
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

print "? "
STDIN.gets

puts "Openting the file..."
target = File.open(filename, 'w')

#puts "Truncating the file.  Goodbye!"
#target.truncate(target.size)

puts "Now I'm going to ask you for three lines."

print "line1: "; line1 = STDIN.gets
print "line2: "; line2 = STDIN.gets
print "line3: "; line3 = STDIN.gets

puts "I'm going to write these to the file."

line = line1 + line2 + line3
target.write(line)

puts "And, finally, we close the file."
target.close()