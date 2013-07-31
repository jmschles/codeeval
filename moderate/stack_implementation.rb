class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.delete_at(-1)
  end
end

File.open(ARGV[0]).each_line do |line|

  next if line.chomp.empty?

  data = line.chomp.split(' ')

  s = Stack.new
  data.each { |el| s.push(el) }

  to_print = []

  until s.stack.empty?
    to_print << s.pop
    s.pop
  end

  puts to_print.join(' ')
end