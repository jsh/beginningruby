if ARGV == [] then
	ARGV << "foo.txt"
	ARGV << "bar.txt"
end
$stdout.sync = true

from_file, to_file = ARGV




File.write(to_file, File.read(from_file))
