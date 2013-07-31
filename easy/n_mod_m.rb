File.open(ARGV[0]).each_line do |line|
  args = line.chomp.split(",").map { |n| n.to_i }
  n, m = args[0], args[1]
  until n < m
    n = n - m
  end
  puts n
end