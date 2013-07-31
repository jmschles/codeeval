File.open(ARGV[0]).each_line do |line|

  # parse input
  sequence, target = line.chomp.split(';')

  sequence = sequence.split(',').map(&:to_i)
  target = target.to_i

  pairs = []

  # find pairs
  sequence.each_with_index do |n1, i|
    sequence.each_with_index do |n2, j|
      next if j <= i
      if n1 + n2 == target
        pairs << [n1, n2]
      end
    end
  end

  # print result
  if pairs.empty?
    puts "NULL"
  else
    pairs_string = ""
    pairs.each do |pair|
      pairs_string += pair.join(',')
      pairs_string += ';'
    end
    puts pairs_string.chomp(';')
  end

end
