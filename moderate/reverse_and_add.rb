def is_palindrome?(n)
  num_string = n.to_s
  n.to_s == n.to_s.reverse
end

def reverse_and_add(n)
  n += n.to_s.reverse.to_i
end

File.open(ARGV[0]).each_line do |line|
  num = line.chomp.to_i
  iterations = 0
  until is_palindrome?(num)
    num = reverse_and_add(num)
    iterations += 1
  end
  puts "#{iterations} #{num}"
end