File.open(ARGV[0]).each_line do |line|
  puts line.chomp.split.each { |w| w[0] = w[0].upcase }.join(' ')
end