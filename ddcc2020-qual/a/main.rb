X, Y = gets.split.map(&:to_i)
def yen(rank)
  if rank == 1
    300000
  elsif rank == 2
    200000
  elsif rank == 3
    100000
  else
    0
  end
end

ans = yen(X) + yen(Y) + (X == 1 && Y == 1 ? 400000 : 0)
puts ans
