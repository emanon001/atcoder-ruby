require 'set'
N = gets.to_i
S = gets.chomp.chars
# ch_to_idxs = Hash.new
# S.each.with_index do |ch, i|
#   ch_to_idxs[ch] = [] unless ch_to_idxs[ch]
#   ch_to_idxs[ch].push(i)
# end

ans = 0
max_span = 1
S.each.with_index do |ch, i|
  ((max_span + 1)..(N - i - 1)).each do |span|
    ((i + span)..(N - 1 - span + 1)).each do |j|
      c = 0
      ok = true
      while c < span
        unless S[i + c] == S[j + c]
          ok = false
          break
        end
        c += 1
      end
      if ok
        max_span = span
        ans = span
      end
    end
    next if ans == span
  end
end
puts ans
