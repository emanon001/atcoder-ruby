N, K = gets.split.map(&:to_i)
R, S, P = gets.split.map(&:to_i)
T = gets.chomp.chars

ans = 0
rock_count = 0

def count(ch)
  mark = Array.new(N)
  ret = 0
  T.each.with_index do |ch2, i|
    next if mark[i]
    count = 0
    next if ch2 != ch
    j = i
    prev = nil
    while j < N
      mark[j] = true
      if T[j] == ch && prev != ch
        count += 1
        prev = T[j]
      else
        prev = nil
      end
      j += K
    end
    ret += count
  end
  ret
end

rsum = count('s') * R
ssum = count('p') * S
psum = count('r') * P
puts rsum + ssum + psum