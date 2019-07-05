N = gets.to_i
board = N.times.map { gets.chomp.chars }
board.transpose.each do |row|
  puts row.reverse.join('')
end
