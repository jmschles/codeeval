File.open(ARGV[0]).each_line do |line|
  num = line.chomp.to_i
  digits = line.chomp.split("").map { |n| n.to_i }
  exp = digits.count
  sum = digits.map { |n| n ** exp }.inject(:+)
  (sum == num) ? puts('True') : puts('False')
end