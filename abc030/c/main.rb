N, M = gets.split.map(&:to_i)
X, Y = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
b_list = gets.split.map(&:to_i)

time = 0
turn = 0
count = 0
while true
  l = turn == 0 ? a_list : b_list
  start = l.bsearch { |n| n >= time }
  break unless start
  time = start + (turn == 0 ? X : Y)
  turn = (turn + 1) % 2
  count += 1
end
ans = count / 2
puts ans
