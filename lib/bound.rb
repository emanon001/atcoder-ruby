def lower_bound(array, value)
  array.bsearch_index do |x|
    x >= value
  end
end

def upper_bound(array, value)
  i = array.bsearch_index do |x|
    x >= value
  end
  if i.nil?
    array.empty? ? nil : array.size - 1
  elsif i >= 1
    i - 1
  else
    nil
  end
end

def former(array, value)
  array.bsearch do |x|
    x >= value
  end
end

def latter(array, value)
  i = array.bsearch_index do |x|
    x >= value
  end
  if i.nil?
    array.empty? ? nil : array[-1]
  elsif i >= 1
    array[i - 1]
  else
    nil
  end
end
