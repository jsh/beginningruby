if ARGV == [] then
	ARGV << "foo.txt"
	ARGV << "bar.txt"
end
$stdout.sync = true

File.copy_stream(ARGV[0], ARGV[1])