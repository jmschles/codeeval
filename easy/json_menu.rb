require 'json'

File.open(ARGV[0]).each_line do |line|
  next if line.chomp.empty?

  menu = JSON.parse(line)

  id_sum = 0
  menu['menu']['items'].each do |item|
    next unless item
    if item['label']
      id_sum += item['id']
    end
  end

  puts id_sum
end