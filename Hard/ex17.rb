if ARGV == [] then
	ARGV << "foo.txt"
	ARGV << "bar.txt"
end
$stdout.sync = true

from_file, to_file = ARGV



contents = File.read(from_file)

File.open(to_file, 'w').write(contents)
