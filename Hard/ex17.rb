if ARGV == [] then
	ARGV << "foo.txt"
	ARGV << "bar.txt"
end
$stdout.sync = true

File.write(ARGV[1], File.read(ARGV[0]))
