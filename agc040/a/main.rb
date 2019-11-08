S = gets.chomp.chars
ans = 0
l_count = 0
r_v = 0
skip_r_v = nil
S.each do |ch|
  if ch == '<'
    l_count += 1
    r_v = 0
    skip_r_v = nil
    ans += l_count - 1
  else
    if r_v + 1 == skip_r_v
      r_v = skip_r_v + 1
    else
      r_v += 1
    end
    if l_count >= 2
      ans += l_count
      skip_r_v = l_count
      r_v = 0
    else
      ans += r_v
    end
    l_count = 0
  end
end
if S[-1] == '<'
  ans += l_count
end
puts ans

# < > > > < < > < < < < < > > > <
# 0 3 2 1 0 1 2 0 1 2 3 4 5 2 1 0 1

# < < > > > >
# 0 1 4 3 2 1

# > > < < < <
# 2 1 0 1 2 3
