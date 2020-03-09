A, B = gets.split.map(&:to_i)

(1..2000).each do |a|
  if (a * 0.08).to_i == A && (a * 0.1).to_i == B
    puts a
    exit 0
  end
end
puts -1