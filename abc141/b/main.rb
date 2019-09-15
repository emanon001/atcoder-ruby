S = gets.chomp.chars
ans = true
S.each.with_index do |ch, i|
  i += 1
  if i.odd?
    ans = false unless ['R', 'U', 'D'].include?(ch)
  else
    ans = false unless ['L', 'U', 'D'].include?(ch)
  end
end
puts(ans ? 'Yes' : 'No')
