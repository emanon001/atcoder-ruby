S = gets.chomp

colors = 'WBWBWWBWBWBW'
sounds = ['Do', 'Do', 'Re', 'Re', 'Mi', 'Fa', 'Fa', 'So', 'So', 'La', 'La', 'Si']
i = S.index(colors)
if i
  i = i % colors.size
  puts sounds[-i]
else
  puts sounds[-9]
end
