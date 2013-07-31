File.open(ARGV[0]).each_line do |line|
  data = line.chomp.split(' ')
  m = data.pop.to_i
  puts data[-m]
end