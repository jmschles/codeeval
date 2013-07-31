def fb(a, b, n)
  output = []
  (1..n).each do |num|
    if num % a == 0 && num % b == 0
      output << "FB"
    elsif num % a == 0
      output << "F"
    elsif num % b == 0
      output << "B"
    else
      output << num
    end
  end
  output.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  args = line.split.map { |el| el.to_i }
  puts fb(args[0], args[1], args[2])
end