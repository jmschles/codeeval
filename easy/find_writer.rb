File.open(ARGV[0]).each_line do |line|
  next if line.chomp.empty?

  code, keys_string = line.split('| ')

  keys = keys_string.split.map { |k| (k.to_i - 1) }

  author = ""
  keys.each do |key|
    author += code[key]
  end

  puts author
end