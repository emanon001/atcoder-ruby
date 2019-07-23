n = gets.to_i
a_list = gets.split.map(&:to_i)

def calc(list, first_is_positive)
  first = list[0]
  count = if first_is_positive
    first > 0 ? 0 : 1 - first
  else
    first < 0 ? 0 : (-1 - first).abs
  end
  sum = first_is_positive ? first + count : first - count
  list[1..-1].each do |a|
    if sum > 0
      # plus to minus
      if a >= 0
        count += (a + sum) + 1
        sum = -1
      else
        if sum + a < 0
          sum += a
        else
          count += (sum + a) + 1
          sum = -1
        end
      end
    else
      # minus to plus
      if a >= 0
        if sum + a > 0
          sum += a
        else
          count += (sum + a).abs + 1
          sum = 1
        end
      else
        count += (a + sum).abs + 1
        sum = 1
      end
    end
  end
  count
end

ans = [
  calc(a_list, true),
  calc(a_list, false)
].min
puts ans
