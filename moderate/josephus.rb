class Link
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
  end
end

File.open(ARGV[0]).each_line do |line|
  n, k = line.chomp.split(',').map(&:to_i)

  list_of_links = []

  (0...n).each do |value|
    list_of_links << Link.new(value)
  end

  list_of_links.each_with_index do |link, i|
    break if i == list_of_links.count - 1
    link.next = list_of_links[i+1]
  end

  list_of_links[-1].next = list_of_links[0]

  executed = []

  current = list_of_links[-1]
  until list_of_links.empty?
    (k-1).times { current = current.next }
    previous_link = current
    current = current.next
    to_execute = current
    executed << current.value

    previous_link.next = current.next
    list_of_links.delete(current)
  end

  puts executed.join(' ')
end