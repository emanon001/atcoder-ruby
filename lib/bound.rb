def lower_bound(ary, x)
  i = ary.bsearch_index { |y| x <= y }
  i ? i : ary.size
end

def upper_bound(ary, x)
  i = ary.bsearch_index { |y| x < y }
  i ? i : ary.size
end
