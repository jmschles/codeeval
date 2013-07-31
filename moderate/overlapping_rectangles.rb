def y_overlap?(a_top, a_bottom, b_top, b_bottom)
  a_range = (a_bottom..a_top).to_a
  b_range = (b_bottom..b_top).to_a
  (a_range & b_range).empty? ? false : true
end

def x_overlap?(a_left, a_right, b_left, b_right)
  a_range = (a_left..a_right).to_a
  b_range = (a_left..a_right).to_a
  (a_range & b_range).empty? ? false : true
end

File.open(ARGV[0]).each_line do |line|
  coords = line.split(',').map(&:to_i)
  if x_overlap?(coords[0], coords[2], coords[4], coords[6]) &&
     y_overlap?(coords[1], coords[3], coords[5], coords[7])
      puts 'True'
  else
      puts 'False'
  end
end