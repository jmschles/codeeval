def find_winner(names, n)
  remove_player(names, n) until names.count == 1
  names.first
end

def remove_player(names, n)
  names.delete_at(n % names.length - 1)
  names
end

File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  names_str, num_str = line.chomp.split(' | ')
  puts find_winner(names_str.split, num_str.to_i)
end
