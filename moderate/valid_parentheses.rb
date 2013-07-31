OPPOSITES = {
  '(' => ')',
  ')' => '(',
  '{' => '}',
  '}' => '{',
  '[' => ']',
  ']' => '['
}

File.open(ARGV[0]).each_line do |line|
  input = line.chomp

  stack = []
  nest_level = 0

  input.each_char do |c|
    if '{[('.include?(c)
      stack.push(c)
    else
      if stack.last == OPPOSITES[c]
        stack.pop
      end
    end
  end

  (stack.empty?) ? puts('True') : puts('False')

end