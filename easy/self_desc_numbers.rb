def self_describing(str)
  idx = 0

  str.each_char do |c|
    if c.to_i != str.count(idx.to_s)
      return false
    else
      idx += 1
    end
  end
  true
end

File.open(ARGV[0]).each_line do |line|
  self_describing(line.chomp) ? puts(1) : puts(0)
end