class Sudoku

  def initialize(size, flat_array)
    @size = size
    @grid = Array.new(@size) { [] }
    populate_grid(flat_array)
  end

  def valid?
    horiz_check? && vert_check? && square_check?
  end

  private

  def populate_grid(flat_array)
    @size.times do |i|
      @size.times do |j|
        @grid[i] << flat_array.shift
      end
    end
  end

  def horiz_check?
    @grid.each do |row|
      return false unless row.sort == (1..@size).to_a
    end
    true
  end

  def vert_check?
    (0...@size).each do |col|
      current_column = []
      @grid.each_index do |row|
        current_column << @grid[row][col]
      end
      return false unless current_column.sort == (1..@size).to_a
    end
    true
  end

  def square_check?
    box_size = Math.sqrt(@size).to_i

    box_size.times do |i| # i = vertical displacement multiplier
      box_size.times do |j| # j = horizontal displacement multiplier
        square = []
        box_size.times do |m|
          box_size.times do |n|
            square << @grid[(i * box_size)+m][(j * box_size)+n]
          end
        end
        return false unless square.sort == (1..@size).to_a
      end
    end
    true
  end
end

File.open(ARGV[0]).each_line do |line|
  size_string, flat_array_string = line.chomp.split(';')
  size = size_string.to_i
  flat_array = flat_array_string.split(',').map(&:to_i)

  sudoku = Sudoku.new(size, flat_array)

  sudoku.valid? ? puts('True') : puts('False')
end