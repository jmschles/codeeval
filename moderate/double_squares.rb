require 'benchmark'
require 'set'

SQUARES = Set.new

n = 0
until n ** 2 > 2147483647
  SQUARES.add(n ** 2)
  n += 1
end

line_no = 0

File.open(ARGV[0]).each_line do |line|
  if line_no == 0
    num_cases = line.chomp.to_i
  else
    pairs_count = 0
    target = line.chomp.to_i
    SQUARES.each_with_index do |sq1, i|
      break if sq1 > target / 2
      sq2_attempt = target - sq1
      if SQUARES.include?(sq2_attempt)
        pairs_count += 1
      end
    end
    puts pairs_count
  end
  line_no += 1
end