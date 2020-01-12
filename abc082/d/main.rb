s = gets.chomp
x, y = gets.split.map(&:to_i)
s_size = s.size

f_counts = s.split('T').map(&:size)
x_counts = f_counts.select.with_index { |size, i| i.even? }
y_counts = f_counts.select.with_index { |size, i| i.odd? }

def exec_dp(pos, counts)
  dp = {}
  dp[pos] = true
  (counts || []).each do |c|
    next if c == 0
    new_dp = {}
    dp.each do |i, _|
      new_dp[i - c] = true
      new_dp[i + c] = true
    end
    dp = new_dp
  end
  dp
end

xdp = if x_counts.size == 0
  { 0 => true }
else
  exec_dp(x_counts[0], x_counts[1..-1])
end
ydp = exec_dp(0, y_counts)
is_ok = xdp[x] && ydp[y]
puts(is_ok ? 'Yes' : 'No')