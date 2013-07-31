File.open(ARGV[0]).each_line do |line|
  args = line.chomp.split(',')

  ans = -1
  idx = 0

  args[0].each_char do |c|
    if c == args[1]
      ans = idx
    end
    idx += 1
  end
  puts ans
end