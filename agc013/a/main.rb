N = gets.to_i
A = gets.split.map(&:to_i)

def gte(start)
  current = A[start]
  (start...N).each do |i|
    next_v = A[i]
    if next_v < current
      return i
    end
    current = next_v
  end
  return N
end

def lte(start)
  current = A[start]
  (start...N).each do |i|
    next_v = A[i]
    if A[i] > current
      return i
    end
    current = next_v
  end
  return N
end


ans = 0
i = 0
while i < N
  i = [gte(i), lte(i)].max
  ans += 1
end
puts ans