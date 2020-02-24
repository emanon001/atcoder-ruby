R, C = gets.split.map(&:to_i)
state = R.times.map { gets.chomp.split.map(&:to_i) }

def max(a, b); a > b ? a : b; end

ans = 0
(0...(1 << R)).each do |r_choice|
  sum = 0
  C.times do |i| # col
    front = 0
    R.times do |j| # row
      v = state[j][i] ^ r_choice[j]
      front += 1 if v == 1
    end
    sum += max(front, R - front)
  end
  ans = sum if sum > ans
end
puts ans