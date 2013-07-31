File.open(ARGV[0]).each_line do |line|
  idx = 0
  line.each_char do |c|
    if c.ord.between?(65, 90)
      line[idx] = line[idx].downcase
    elsif c.ord.between?(97, 122)
      line[idx] = line[idx].upcase
    end
    idx += 1
  end
  puts line
end