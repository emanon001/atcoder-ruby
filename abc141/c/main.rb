N, K, Q = gets.split.map(&:to_i)
as = Q.times.map { gets.to_i }
a_to_count = Hash.new { 0 }
as.each do |a|
  a_to_count[a] += 1
end
N.times do |n|
  n += 1
  if Q - a_to_count[n] >= K
    puts 'No'
  else
    puts 'Yes'
  end
end
