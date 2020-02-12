S = gets.chomp.chars
T = gets.chomp.chars

if T.size > S.size
  puts 'UNRESTORABLE'
  exit 0
end

def fill(s)
  s.map { |ch| ch == '?' ? 'a' : ch }.join('')
end

(S.size - T.size).downto(0) do |i|
  is_ok = true
  T.size.times do |j|
    s = S[i + j]
    t = T[j]
    next if s == '?'
    if s != t
      is_ok = false
      break
    end
  end
  if is_ok
    ans = (i == 0 ? '' : fill(S[0..(i - 1)])) \
      + T.join('') \
      + (i + T.size == S.size ? '' : fill(S[(i + T.size)..-1]))
    puts ans
    exit 0
  end
end
puts 'UNRESTORABLE'