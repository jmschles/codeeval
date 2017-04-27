class Automaton
  attr_reader :size, :iterations

  def initialize(initial_state)
    @state = initial_state
    @size = initial_state.length
    @iterations = 10
  end

  def evolve!
    iterations.times do |i|
      @state = create_next_state
    end
  end

  def print_result
    @state.each { |sub_arr| puts sub_arr.join }
  end

  def create_next_state
    new_state = []
    @state.each_with_index do |sub_arr, i|
      new_sub_arr = []
      sub_arr.each_with_index do |element, j|
        living_neighbors = neighbors(i, j).count('*')
        new_sub_arr << determine_fate(element, living_neighbors)
      end
      new_state << new_sub_arr
    end
    new_state
  end

  def neighbors(i, j)
    [
      [i-1,j],
      [i-1,j-1],
      [i-1,j+1],
      [i+1,j],
      [i+1,j-1],
      [i+1,j+1],
      [i,j-1],
      [i,j+1]
    ].select do |coords|
      coords.all? { |coord| coord.between?(0, size-1) }
    end.map { |valid_coords| @state[valid_coords.first][valid_coords.last] }
  end

  def determine_fate(current_state, living_neighbors)
    if current_state == '*'
      if living_neighbors < 2
        '.'
      elsif living_neighbors > 3
        '.'
      else
        '*'
      end
    elsif current_state == '.'
      living_neighbors == 3 ? '*' : '.'
    end
  end
end

initial_state = []
File.open(ARGV[0]).each_line do |line|
  initial_state << line.chomp.split('')
end

a = Automaton.new(initial_state)
a.evolve!
a.print_result
