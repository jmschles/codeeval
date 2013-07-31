File.open(ARGV[0]).each_line do |line|
  list_string, k_string = line.chomp.split(';')
  k = k_string.to_i
  list = list_string.split(',').map(&:to_i)

  result = []

  until list.count < k
    result += list.shift(k).reverse
  end

  result += list

  puts result.join(',')
end