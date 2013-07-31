File.open(ARGV[0]).each_line do |line|
  elements = line.chomp.split(',').map(&:to_i)

  subsets = elements.combination(4).to_a

  zero_sums = 0

  subsets.each do |subset|
    zero_sums += 1 if subset.inject(:+) == 0
  end

  puts zero_sums
end