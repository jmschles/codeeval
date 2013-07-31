def is_prime?(n)
  return false if n < 2
  return true if n == 2
  (2..Math.sqrt(n)).each { |num| return false if n % num == 0 }
  true
end

def prime_pal
  best = 0
  (1..1000).each do |n|
    if is_prime?(n) && n.to_s == n.to_s.reverse
      best = n
    end
  end
  puts best
end

prime_pal