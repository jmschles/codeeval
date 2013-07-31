class Array
  def bubble_sort!
    sorted = false
    until sorted
      sorted = true

      self.each_index do |i|
        next if i >= count - 1
        if self[i] > self[i+1]
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    self
  end

  def merge_sort
    return self if arr.count <= 1

    middle_index = count / 2
    left, right = self[0...middle_index], self[middle_index..-1]
    merge(left.merge_sort, right.merge_sort)
  end
end

def merge(arr1, arr2)
  merged = []

  until arr1.empty? || arr2.empty?
    if arr1.first <= arr2.first
      merged.push(arr1.shift)
    else
      merged.push(arr2.shift)
    end
  end

  merged.concat(arr1).concat(arr2)
end

File.open(ARGV[0]).each_line do |line|
  puts line.chomp.split.map(&:to_f).bubble_sort!.map { |n| '%0.3f' % n }.join(" ")
end