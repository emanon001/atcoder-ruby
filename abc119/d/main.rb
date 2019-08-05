A, B, Q = gets.split.map(&:to_i)
s_list = A.times.map { gets.to_i }
t_list = B.times.map { gets.to_i }
x_list = Q.times.map { gets.to_i }

MAX = 1 << 60

x_list.each do |x|
  si = s_list.bsearch_index do |s|
    s >= x
  end
  ti = t_list.bsearch_index do |t|
    t >= x
  end
  s_candidates = []
  t_candidates = []
  if si
    s_candidates.push(s_list[si])
    s_candidates.push(s_list[si - 1]) if si > 0
  else
    s_candidates.push(s_list[-1])
  end
  if ti
    t_candidates.push(t_list[ti])
    t_candidates.push(t_list[ti - 1]) if ti > 0
  else
    t_candidates.push(t_list[-1])
  end
  ans = MAX
  s_candidates.each do |s|
    t_candidates.each do |t|
      n = (s - t).abs + [(x - s).abs, (x - t).abs].min
      ans = n if n < ans
    end
  end
  puts ans
end
