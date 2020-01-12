N, M = gets.split.map(&:to_i)
ps = M.times.map { gets.chomp.split }
ac_c = 0
wa_c = 0
ac_cond = Array.new(N)
wa_cond = Array.new(N, 0)
ps.each do |pv, s|
  pv = pv.to_i 
  pv -= 1
  ac = ac_cond[pv]
  wa_count = wa_cond[pv]
  case s
  when 'AC'
    next if ac
    ac_cond[pv] = true
    ac_c += 1
    wa_c += wa_count
  when 'WA'
    wa_cond[pv] += 1
  end
end
puts "#{ac_c} #{wa_c}"