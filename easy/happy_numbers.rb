require 'set'

File.open(ARGV[0]).each_line do |line|

  num = line.to_i
  visited = Set.new

  while true
    if visited.include?(num)
      puts 0
      break
    elsif num == 1
      puts 1
      break
    else
      visited.add(num)
      num = num.to_s.split("").map { |n| n.to_i }.map { |n| n ** 2 }.inject(:+)
    end
  end
end