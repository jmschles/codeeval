ROMAN_TO_ARABIC = {
  'M' => 1000,
  'D' => 500,
  'C' => 100,
  'L' => 50,
  'X' => 10,
  'V' => 5,
  'I' => 1
}

def pair_value(pair)
  pair[0].to_i * ROMAN_TO_ARABIC[pair[1]]
end

def need_to_subtract?(pair1, pair2)
  ROMAN_TO_ARABIC[pair2[1]] > ROMAN_TO_ARABIC[pair1[1]]
end

def get_total(pairs)
  total = 0
  i = 0
  until i == pairs.length - 1
    value = pair_value(pairs[i])
    operator = need_to_subtract?(pairs[i], pairs[i+1]) ? :- : :+
    total = total.send(operator, value)
    i += 1
  end
  total + pair_value(pairs.last)
end

File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  pairs = line.scan(/.{2}/)
  puts get_total(pairs)
end
