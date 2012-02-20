ARGV << "foo.txt" << "bar.txt"

File.copy_stream(ARGV[0], ARGV[1])