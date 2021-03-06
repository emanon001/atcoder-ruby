N = gets.to_i
S = gets.chomp.chars

def zalgo(s, offset)
  size = s.size - offset
  ret = Array.new(size)
  ret[0] = size
  i = 1
  j = 0
  while i < size
    while i + j < size && s[offset + j] == s[offset + i + j]
      j += 1
    end
    ret[i] = j
    if j == 0
      i += 1
      next
    end
    k = 1
    while i + k < size && k + ret[k] < j
      ret[i + k] = ret[k]
      k += 1
    end
    i += k
    j -= k
  end
  ret
end

ans = 0
(0...N).each do |i|
  lcp = zalgo(S, i)
  (1...(lcp.size)).each do |j|
    c = [lcp[j], j].min
    ans = c if c > ans
  end
end
puts ans
