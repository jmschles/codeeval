File.open(ARGV[0]).each_line do |line|
  next if line.chomp.empty?
  if line.chomp =~ /\A"?([^@\s><"]+)"?@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    puts true
  else
    puts false
  end
end