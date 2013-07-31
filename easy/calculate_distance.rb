File.open(ARGV[0]).each_line do |line|
  input = line.split(/[^-?\d+]/)
  input.delete("")
  coords = input.map { |n| n.to_i }

  x_dist = coords[0] - coords[2]
  y_dist = coords[1] - coords[3]

  puts Math.sqrt((x_dist ** 2) + (y_dist ** 2)).to_i
end