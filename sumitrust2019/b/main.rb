N = gets.to_i
# a = N / 1.08
# if (a * 1.08).to_i == N
#   puts a.round.to_i
# else
#   puts ':('
# end

(1..N).each do |n|
  if (n * 1.08).to_i == N
    puts n
    exit 0
  end
end
puts ':('
