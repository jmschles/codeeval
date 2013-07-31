class QueryBoard
  def initialize
    @board = Array.new(256) { Array.new(256, 0) }
  end

  def set_row(i, x)
    @board[i].fill(x)
  end

  def set_col(j, x)
    @board.each { |row| row[j] = x }
  end

  def query_row(i)
    puts @board[i].inject(:+)
  end

  def query_col(j)
    sum = 0
    @board.each { |row| sum += row[j] }
    puts sum
  end
end

query = QueryBoard.new

File.open(ARGV[0]).each_line do |line|
  args = line.chomp.split
  case args[0]
  when "SetRow"
    query.set_row(args[1].to_i, args[2].to_i)
  when "SetCol"
    query.set_col(args[1].to_i, args[2].to_i)
  when "QueryRow"
    query.query_row(args[1].to_i)
  when "QueryCol"
    query.query_col(args[1].to_i)
  end
end