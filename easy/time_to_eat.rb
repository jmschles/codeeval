class StupidTime
  attr_reader :hours, :minutes, :seconds, :time_str

  def initialize(time_str)
    @time_str = time_str
    @hours, @minutes, @seconds = time_str.split(':').map(&:to_i)
  end
end

def sort_times(time_strs)
  time_strs.map { |s| StupidTime.new(s) }
    .sort_by { |t| [-t.hours, -t.minutes, -t.seconds] }
    .map(&:time_str)
end

File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  sorted_times = sort_times(line.chomp.split)
  puts sorted_times.join(' ')
end
