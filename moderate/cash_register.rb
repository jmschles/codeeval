require 'bigdecimal'

CASH_HASH = { 'PENNY' => 0.01,
              'NICKEL' => 0.05,
              'DIME' => 0.10,
              'QUARTER' => 0.25,
              'HALF DOLLAR' => 0.50,
              'ONE' => 1.00,
              'TWO' => 2.00,
              'FIVE' => 5.00,
              'TEN' => 10.00,
              'TWENTY' => 20.00,
              'FIFTY' => 50.00,
              'ONE HUNDRED' => 100.00
            }

File.open(ARGV[0]).each_line do |line|
  data = line.chomp.split(';')
  purchase = BigDecimal.new(data[0])
  cash = BigDecimal.new(data[1])

  change_string = ""
  change_owed = cash - purchase

  if change_owed < 0
    puts "ERROR"
    next
  elsif change_owed == 0
    puts "ZERO"
    next
  else
    until change_owed == 0
      CASH_HASH.sort_by { |k,v| -v }.each do |pair|
        until change_owed < pair[1]
          change_string += "#{pair[0]},"
          change_owed -= pair[1]
        end
        break if change_owed == 0
      end
    end
    puts change_string.chomp(',')
  end
end