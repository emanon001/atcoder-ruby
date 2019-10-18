A, B = gets.split.map(&:to_i)
S = gets.chomp
is_ok = S =~ /\A\d{#{A}}-\d{#{B}}\z/
puts(is_ok ? 'Yes' : 'No')
