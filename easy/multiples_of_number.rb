def multiples_of_number(x, n)
  ans = n
  until ans >= x
    ans += n
  end
  puts ans
end

File.open(ARGV[0]).each_line do |line|
  args = line.split(',').map { |el| el.to_i }
  multiples_of_number(args[0], args[1])
end