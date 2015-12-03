def parse_line(line)
  line.chomp.split(', ').inject({}) do |memo, blob|
    split_blob = blob.split(': ')
    memo[split_blob.first.downcase.to_sym] = split_blob.last.to_i
    memo
  end
end

def total_candies(data)
  (data[:vampires] * 3 + data[:zombies] * 4 + data[:witches] * 5) * data[:houses]
end

def num_houses(data)
  data[:vampires] + data[:zombies] + data[:witches]
end

File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  data = parse_line(line)
  puts total_candies(data) / num_houses(data)
end
