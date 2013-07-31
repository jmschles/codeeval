require 'set'

PRIMES = Set.new

def is_prime?(n)
  return true if PRIMES.include?(n)
  return false if n < 2
  return true if n == 2
  (2..Math.sqrt(n)).each { |divisor| return false if n % divisor == 0 }
  PRIMES.add(n)
  true
end

File.open(ARGV[0]).each_line do |line|
  lower_bound, upper_bound = line.split(',').map(&:to_i)

  primes_count = 0

  (lower_bound..upper_bound).each do |n|
    primes_count += 1 if is_prime?(n)
  end

  puts primes_count
end