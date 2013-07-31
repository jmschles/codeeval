KNOWN_ROWS = { 1 => [1], 2 => [1,1] }

def pascals(n)
  if KNOWN_ROWS.has_key?(n)
    pascals = []
    (1..n).each { |row| pascals << KNOWN_ROWS[row] }
    pascals
  else
    current_triangle = pascals(n-1)
    KNOWN_ROWS[n] = next_row(current_triangle[-1])
    current_triangle + [KNOWN_ROWS[n]]
  end
end

def next_row(row)
  new_row = []
  row.each_index do |i|
    break if i == row.length - 1
    new_row << (row[i] + row[i+1])
  end
  new_row.unshift(1)
  new_row.push(1)
  new_row
end

File.open(ARGV[0]).each_line do |line|
  puts pascals(line.chomp.to_i).flatten.join(' ')
end