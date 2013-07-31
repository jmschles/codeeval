File.open(ARGV[0]).each_line do |line|
  raw_points = line.chomp.split(', ')

  points = []
  parser = /(?<x>\d+),(?<y>\d+)/

  raw_points.each do |str|
    match = parser.match(str)
    points << [match[1].to_i, match[2].to_i]
  end

  line_lengths = []

  points.each_with_index do |pair1, i|
    break if i == 3
    points.each_with_index do |pair2, j|
      next if j <= i
      x_dist, y_dist = pair1[0] - pair2[0], pair1[1] - pair2[1]
      line_lengths << Math.sqrt(x_dist ** 2 + y_dist ** 2)
    end
  end

  line_lengths.sort!

  square = false

  if line_lengths[0..3].uniq.count == 1
    if line_lengths[4..5].uniq.count == 1
      if line_lengths[4].round(4) == (line_lengths[0] * Math.sqrt(2)).round(4)
        square = true
      end
    end
  end

  puts square

end