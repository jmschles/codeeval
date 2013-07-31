File.open(ARGV[0]).each_line do |line|
  str = line.chomp.downcase
  ltr_cnts = {}
  str.each_char do |c|
    if c =~ /[a-z]/
      ltr_cnts.include?(c) ? ltr_cnts[c] += 1 : ltr_cnts[c] = 1
    end
  end

  total_beauty = 0
  beauty_multiplier = 26

  until ltr_cnts.empty?
    max_value, max_key = 0, ""
    ltr_cnts.each_pair do |k, v|
      if v > max_value
        max_key, max_value = k, v
      end
    end

    total_beauty += (beauty_multiplier * max_value)
    beauty_multiplier -= 1
    ltr_cnts.delete(max_key)
  end

  puts total_beauty
end