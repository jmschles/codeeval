def make_change(n, coin_vals, min_coins)
  return min_coins if coin_vals.empty?

  m = n
  change = []

  coin_vals.each do |coin|
    until m < coin
      change << coin
      m -= coin
    end
  end

  num_coins = change.length

  if num_coins < min_coins
    min_coins = num_coins
  end

  make_change(n, coin_vals[1..-1], min_coins)
end

File.open(ARGV[0]).each_line do |line|
  n = line.chomp.to_i
  puts make_change(n, [5, 3, 1], n)
end