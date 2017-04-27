class CocktailSorter
  attr_reader :arr

  def initialize(arr, iterations)
    @arr = arr
    @iterations = iterations
    @min_index = 0
    @max_index = arr.length - 2
    @current_index = 0
  end

  def print_result
    puts @arr.join(' ')
  end

  def run!
    @iterations.times { perform_iteration! }
  end

  def perform_iteration!
    do_forward_pass
    do_backward_pass
  end

  def do_forward_pass
    until @current_index > @max_index
      perform_swap if arr[@current_index] >= arr[@current_index + 1]
      @current_index += 1
    end
    @max_index -= 1
    @current_index -= 1
  end

  def do_backward_pass
    until @current_index < @min_index
      perform_swap if @arr[@current_index] >= @arr[@current_index + 1]
      @current_index -= 1
    end
    @min_index += 1
    @current_index += 1
  end

  def perform_swap
    @arr[@current_index], @arr[@current_index + 1] = @arr[@current_index + 1], arr[@current_index]
  end
end

File.open(ARGV[0]).each_line do |line|
  raw_input, raw_iterations = line.chomp.split(' | ')
  arr = raw_input.split.map(&:to_i)
  iterations = raw_iterations.to_i
  sorter = CocktailSorter.new(arr, iterations)
  sorter.run!
  sorter.print_result
end
