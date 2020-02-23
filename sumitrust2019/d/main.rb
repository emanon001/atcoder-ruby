require 'set'

N = gets.to_i
S = gets.chomp.chars.map(&:to_i)

idx = Array.new(10) { [] }
S.each.with_index do |ch, i|
  idx[ch].push(i)
end

ans = 0
(0..999).each do |n|
  i = -1
  is_ok = n.to_s.rjust(3, '0').chars.all? do |ch|
    i = idx[ch.to_i].bsearch do |x|
      x > i
    end
    i != nil
  end
  ans += 1 if is_ok
end
puts ans