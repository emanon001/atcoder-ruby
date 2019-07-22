def lower_bound(ary, x)
  i = ary.bsearch_index { |y| x <= y }
  i ? i : ary.size
end

def upper_bound(ary, x)
  i = ary.bsearch_index { |y| x < y }
  i ? i : ary.size
end

N = gets.to_i
a_list = N.times.map { gets.to_i }
list = []
a_list.each do |a|
  i = lower_bound(list, a)
  if i == 0
    list.unshift(a)
  else
    list[i - 1] = a
  end
end
puts list.size
