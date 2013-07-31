line_num = 0
lines = []
lines_to_print = nil

File.open(ARGV[0]).each_line do |line|
  if line_num == 0
    lines_to_print = line.chomp.to_i
  else
    lines << line.chomp
  end
  line_num += 1
end

sorted_lines = lines.sort_by { |l| l.length }

lines_to_print.times do
  puts sorted_lines.pop
end