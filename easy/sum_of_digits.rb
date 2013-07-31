File.open(ARGV[0]).each_line do |line|
  puts line.split('').map { |el| el.to_i }.inject(:+)
end