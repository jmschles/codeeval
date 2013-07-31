File.open(ARGV[0]).each_line do |line|
  next if line.chomp.empty?

  len, sequence = line.chomp.split(';')
  sequence = sequence.split(',').map(&:to_i)

  sequence.delete_if { |x| sequence.count(x) == 1 }
  puts sequence[0]
end