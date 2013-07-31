File.open(ARGV[0]).each_line do |line|
  nums = line.split.map { |n| n.to_i }
  lowest_uniq = nums.dup.delete_if { |n| nums.count(n) > 1 }.sort.first

  lowest_uniq ? puts(nums.index(lowest_uniq) + 1) : puts(0)
end