def fib(n)
  return nil if n < 0
  return 0 if n == 0
  return 1 if n == 1
  fib(n-1) + fib(n-2)
end

File.open(ARGV[0]).each_line do |line|
  puts fib(line.to_i)
end