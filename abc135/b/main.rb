N = gets.to_i
p_list = gets.split.map(&:to_i)
sorted = p_list.sort
diff_count =p_list.zip(sorted).count do |(a, b)|
  a != b
end
puts(diff_count <= 2 ? 'YES' : 'NO')
