def to_binary(n)
  binary_array = ["0"]
  until n == 0
    add_one(binary_array)
    n -= 1
  end
  binary_array.join('')
end

def add_one(arr)
  arr.count.times do |i|
    idx = -1 - i
    if arr[idx] == "0"
      arr[idx] = "1"
      return arr
    else
      arr[idx] = "0"
    end
  end
  arr.unshift("1")
end

File.open(ARGV[0]).each_line do |line|
  puts to_binary(line.chomp.to_i)
end