require 'set'
N = gets.to_i
S = gets.chomp.chars

def ok(s, span)
  (0..(N - 1 - span)).each do |i|
    ((i + span)..(N - 1)).each do |j|
      c = 0
      ret = true
      while c < span
        unless s[i + c] == s[j + c]
          ret = false
          break
        end
        c += 1
      end
      if ret
        return true
      end
    end
  end
  false
end

ans = (1..(N - 1)).bsearch do |span|
  !ok(S, span)
end
if ans.nil?
  puts '0'
else
  puts(ans - 1)
end
