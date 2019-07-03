N = gets.to_i
a_list = gets.split.map(&:to_i)

ans = -(2 << 60)
N.times do |i|
  t_sum = -(2 << 60)
  a_max = -(2 << 60)
  N.times do |j|
    next if i == j
    t_sum2 = 0
    a_sum2 = 0
    l = [i, j].min
    r = [i, j].max
    (l..r).each.with_index do |k, ii|
      if ii % 2 == 0
        t_sum2 += a_list[k]
      else
        a_sum2 += a_list[k]
      end
    end
    if a_sum2 > a_max
      a_max = a_sum2
      t_sum = t_sum2
    end
  end
  ans = t_sum if t_sum > ans
end
puts ans
