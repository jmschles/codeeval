File.open(ARGV[0]).each_line do |line|
  line.chomp.each_char do |c|
    if line.count(c) == 1
      puts c
      break
    end
  end
end