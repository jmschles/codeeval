File.open(ARGV[0]).each_line do |line|
  code = line.chomp.split('')

  # all codes can be decoded one digit at a time
  decodes = 1

  # very partial solution, does not account for multiple multi-digit letters
  code.each_index do |i|
    break if i == code.length - 1
    if (code[i] + code[i+1]).to_i <= 26
      decodes += 1
    end
  end

  puts decodes
end