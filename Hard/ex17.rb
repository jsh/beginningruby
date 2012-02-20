if ARGV == [] then
	ARGV << "foo.txt"
	ARGV << "bar.txt"
end
$stdout.sync = true

from_file, to_file = ARGV



contents = File.open(from_file).read

File.open(to_file, 'w').write(contents)
