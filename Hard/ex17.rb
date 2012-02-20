if ARGV == [] then
	ARGV << "foo.txt"
	ARGV << "bar.txt"
end
$stdout.sync = true

from_file, to_file = ARGV



infile = File.open(from_file)
contents = infile.read

outfile = File.open(to_file, 'w')
outfile.write(contents)

infile.close
outfile.close