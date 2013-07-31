HEX_HASH = { "0" => 0,
             "1" => 1,
             "2" => 2,
             "3" => 3,
             "4" => 4,
             "5" => 5,
             "6" => 6,
             "7" => 7,
             "8" => 8,
             "9" => 9,
             "a" => 10,
             "b" => 11,
             "c" => 12,
             "d" => 13,
             "e" => 14,
             "f" => 15
           }


File.open(ARGV[0]).each_line do |line|
  digits = line.chomp.split("").reverse
  result = 0
  digits.each_with_index do |digit, i|
    result += (HEX_HASH[digit] * (16 ** i))
  end
  puts result
end