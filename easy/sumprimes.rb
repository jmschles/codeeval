def is_prime?(n)
  return false if n < 2
  return true if n == 2
  (2..(Math.sqrt(n))).each { |num| return false if n % num == 0 }
  true
end

def sum_primes
  sum, primes_so_far, candidate = 0, 0, 1
  until primes_so_far == 1000
    if is_prime?(candidate)
      primes_so_far += 1
      sum += candidate
    end
    candidate += 1
  end
  puts sum
end

sum_primes