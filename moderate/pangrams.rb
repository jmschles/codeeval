File.open(ARGV[0]).each_line do |line|
  next if line.chomp.empty?

  alpha_hash = {}
  ("a".."z").each { |letter| alpha_hash[letter] = false }

  line.chomp.downcase.each_char do |c|
    next unless ('a'..'z').include?(c)
    alpha_hash[c] = true
  end

  alpha_hash.delete_if { |k, v| v == true }

  if alpha_hash.empty?
    puts "NULL"
  else
    missing_letters_string = ""
    alpha_hash.each_key do |k|
      missing_letters_string += k
    end
    puts missing_letters_string
  end
end