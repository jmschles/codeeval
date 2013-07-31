def bit_pos(n, p1, p2)
  bin = n.to_s(2)
  (bin[-p1] == bin[-p2]) ? true : false
end

File.open(ARGV[0]).each_line do |line|
  args = line.split(',').map { |el| el.to_i }
  n, p1, p2 = args[0], args[1], args[2]
  puts bit_pos(n, p1, p2)
end