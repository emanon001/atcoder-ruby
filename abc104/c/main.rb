D, G = gets.split.map(&:to_i)
PC = D.times.map { gets.split.map(&:to_i) }

MAX = (1 << D) - 1
ans = 1 << 60
(0..MAX).each do |completed|
  score = 0
  solved_count = 0
  D.times do |i|
    if completed[i] == 1
      p_count, bonus = PC[i]
      base_score = (i + 1) * 100
      solved_count += p_count
      score += base_score * p_count + bonus
    end
  end
  rest_score = [G - score, 0].max
  if rest_score == 0
    ans = solved_count if solved_count < ans
  else
    (D - 1).downto(0) do |i|
      next if completed[i] == 1
      p_count = PC[i][0]
      base_score = ((i + 1) * 100)
      count = (rest_score + base_score - 1) / base_score
      next if count >= p_count
      solved_count += count
      ans = solved_count if solved_count < ans
    end
  end
end
puts ans