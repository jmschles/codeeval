require 'set'

KNOWN_PRIMES = [2]

def is_prime?(n)
  return false if n < 2
  return true if n == 2
  (2..Math.sqrt(n)).each { |num| return false if n % num == 0 }
  KNOWN_PRIMES << n
  return true
end

File.open(ARGV[0]).each_line do |line|
  n = line.chomp.to_i
  primes_to_print = []
  (1...n).each do |num|
    if KNOWN_PRIMES.include?(num)
      primes_to_print << num
    elsif num > KNOWN_PRIMES.last
      if is_prime?(num)
        primes_to_print << num
      end
    end
  end
  puts primes_to_print.join(',')
end