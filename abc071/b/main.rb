require 'set'
S = gets.chomp.chars
set = Set.new(S)
('a'..'z').each do |ch|
  unless set.include?(ch)
    puts ch
    exit 0
  end
end
puts 'None'
