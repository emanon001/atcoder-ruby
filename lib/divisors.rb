def divisors(n)
  ret = []
  (1..(Math.sqrt(n))).each do |a|
    if n % a == 0
      ret.push(a)
      b = n / a
      ret.push(b) if a != b
    end
  end
  ret
end