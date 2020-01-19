H = gets.to_i
W = gets.to_i
N = gets.to_i

a = [H, W].max
ans = N % a == 0 ? N / a : N / a + 1
puts ans