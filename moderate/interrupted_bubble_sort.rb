class Array
  def interrupted_bubble_sort(iterations)
    sorted = false
    iterations.times do
      sorted = true
      (0..(length-2)).each do |i|
        if self[i] > self[i+1]
          sorted = false
          self[i], self[i+1] = self[i+1], self[i]
        end
      end
      break if sorted
    end
    self
  end
end

File.open(ARGV[0]).each do |line|
  raw_arr, raw_iterations = line.chomp.split(' | ')
  arr, iterations = raw_arr.split(' ').map(&:to_i), raw_iterations.to_i
  puts arr.interrupted_bubble_sort(iterations).join(' ')
end
