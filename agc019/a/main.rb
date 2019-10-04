Q, H, S, D = gets.split.map(&:to_i)
N = gets.to_i
one_min = [Q * 4, H * 2, S].min
two_min = [Q * 8, H * 4, S * 2, D].min
if N.even?
  puts N / 2 * two_min
else
  ans = N / 2 * two_min + one_min
  puts ans
end
