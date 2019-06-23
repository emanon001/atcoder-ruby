A, B, C, D = gets.split.map(&:to_i)

lcm = C.lcm(D)
sum = B - A + 1

b1 = B / C
b2 = (A - 1) / C
b_c = b1 - b2

d1 = B / D
d2 = (A - 1) / D
d_c = d1 - d2

lcm1 = B / lcm
lcm2 = (A - 1) / lcm
lcm_c = lcm1 - lcm2

ans = sum - b_c - d_c + lcm_c
puts ans
