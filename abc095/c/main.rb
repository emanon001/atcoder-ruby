A, B, C, X, Y = gets.split.map(&:to_i)

x = 0
y = 0
ans = 0
while x < X || y < Y
  if x < X && y < Y
    if A + B > C * 2
      x += 1
      y += 1
      ans += C * 2
    else
      x += 1
      y += 1
      ans += A + B
    end
  elsif x < X
    if A > C * 2
      x += 1
      ans += C * 2
    else
      x += 1
      ans += A
    end
  elsif y < Y
    if B > C * 2
      y += 1
      ans += C * 2
    else
      y += 1
      ans += B
    end
  end
end
puts ans
