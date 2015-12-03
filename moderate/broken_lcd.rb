require 'byebug'

def num_to_lcd_digit
  {
    '0' => '11111100',
    '1' => '01100000',
    '2' => '11011010',
    '3' => '11110010',
    '4' => '01100110',
    '5' => '10110110',
    '6' => '10111110',
    '7' => '11100000',
    '8' => '11111110',
    '9' => '11110110',
  }
end

def add_dot(lcd_digit)
  lcd_digit[-1] = '1'
end

def convert_to_lcd(num_array)
  lcd_array = []
  num_array.each do |digit|
    if digit == '.'
      add_dot(lcd_array.last)
    else
      lcd_array << num_to_lcd_digit[digit]
    end
  end
  lcd_array
end

def displayable?(digit, lcd)
  idx = 0
  digit.each_char do |char|
    next if char == '0'
    return false if lcd[idx] == '0'
    idx += 1
  end
  true
end

File.open('test.txt').each_line do |line|
  segment_states_str, num = line.chomp.split(';')
  segment_states = segment_states_str.split
  lcd_representation = convert_to_lcd(num.split(''))

  screen_positions_to_try = 13 - lcd_representation.count

  screen_position = 0
  while screen_position < screen_positions_to_try
    numeric_position = 0
    while numeric_position < lcd_representation.count
      can_display_digit = displayable?(lcd_representation[numeric_position], segment_states[numeric_position + screen_position])
      break unless can_display_digit
      numeric_position += 1
    end
    debugger  
    break if can_display_digit
    screen_position += 1
  end
  puts (can_display_digit ? '1' : '0')
end
