S = gets.chomp.chars
prev1 = nil
prev2 = nil
S.each.with_index do |ch, i|
  i += 1
  if prev1 == ch
    puts "#{i - 1} #{i}"
    exit 0
  end
  if prev2 == ch
    puts "#{i - 2} #{i}"
    exit 0
  end
  prev2 = prev1
  prev1 = ch
end

puts '-1 -1'
