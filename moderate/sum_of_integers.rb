File.open(ARGV[0]).each_line do |line|

  nums = line.chomp.split(',').map { |n| n.strip.to_i }

  max_sum = 0
  current_sum = 0

  nums.each_with_index do |num1, i|
    nums.each_with_index do |num2, j|
      next if j < i
      current_sum = nums[i..j].inject(:+)
      if current_sum > max_sum
        max_sum = current_sum
      end
    end
  end

  puts max_sum
end