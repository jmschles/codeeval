File.open(ARGV[0]).each_line do |line|
  sets = line.chomp.split(';').map { |substr| substr.split(',') }
  puts (sets[0] & sets[1]).join(',')
end