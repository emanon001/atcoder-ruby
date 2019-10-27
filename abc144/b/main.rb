N = gets.to_i
(1..9).each do |a|
  (1..9).each do |b|
    if a * b == N
      puts 'Yes'
      exit 0
    end
  end
end
puts 'No'
