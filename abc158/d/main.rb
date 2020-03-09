S = gets.chomp.chars
Q = gets.to_i
queries = Q.times.map do
  gets.chomp.split
end

reversed = false
queries.each do |q|
  f = q[0].to_i
  if f == 1
    reversed = !reversed
  else
    f = q[1].to_i
    c = q[2]
    if f == 1
      if reversed
        S.push(c)
      else
        S.unshift(c)
      end
    else
      if reversed
        S.unshift(c)
      else
        S.push(c)
      end
    end
  end
end

ans = (reversed ? S.reverse : S).join('')
puts ans