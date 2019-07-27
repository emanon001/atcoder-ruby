N, X = gets.split.map(&:to_i)

(2..10).each do |m|
  if X.to_s == N.to_s(m)
    puts m
    exit 0
  end
end
