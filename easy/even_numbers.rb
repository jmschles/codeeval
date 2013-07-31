File.open(ARGV[0]).each_line do |line|
  (line.chomp.to_i % 2 == 0) ? puts(1) : puts(0)
end