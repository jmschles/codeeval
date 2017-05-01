File.open(ARGV[0]).each_line do |line|
  raw_n, data = line.split(';')
  n, data = raw_n.to_i, data.split(' ').map(&:to_i)
  max_possible_gain = (0..(data.length - n)).map do |i|
    data[i..(i+n-1)].inject(:+)
  end.max
  max_possible_gain < 0 ? puts(0) : puts(max_possible_gain)
end
