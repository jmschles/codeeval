File.open(ARGV[0]).each_line do |line|
  data = line.chomp.split.map(&:to_i)

  abs_values = []

  data.shift

  len = data.count

  data.each_index do |i|
    break if i == len - 1
    abs_values << (data[i] - data[i+1]).abs
  end

  if abs_values.uniq.sort == (1..(len-1)).to_a
    puts "Jolly"
  else
    puts "Not jolly"
  end
end