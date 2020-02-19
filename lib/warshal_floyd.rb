def warshal_floyd(d)
  v = d.size
  v.times do |k|
    v.times do |i|
      v.times do |j|
        cost = d[i][j]
        new_cost = d[i][k] + d[k][j]
        d[i][j] = new_cost if new_cost < cost 
      end
    end
  end
end