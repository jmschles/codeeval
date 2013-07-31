File.open(ARGV[0]).each_line do |line|
  str, rejects = line.chomp.split(', ')
  puts str.delete(rejects)
end