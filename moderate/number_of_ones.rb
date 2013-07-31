File.open(ARGV[0]).each_line do |line|
  puts line.chomp.to_i.to_s(2).count('1')
end