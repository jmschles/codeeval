def binary_set(n)
  (1..n).map { |num| num.to_s(2) }
end

def right_num_zeroes(binary_str, num_zeroes)
  binary_str.count("0") == num_zeroes
end

def num_matches(binary_set, num_zeroes)
  binary_set.select { |bin_str| right_num_zeroes(bin_str, num_zeroes) }.count
end

File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  num_zeroes, n = line.chomp.split.map(&:to_i)
  puts num_matches(binary_set(n), num_zeroes)
end
