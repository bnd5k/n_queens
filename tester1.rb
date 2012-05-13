#so we've got an algorithm that workds like this
#on the basis of n being odd or even, create sm variable
#
puts "How many queens are there?"
print '> '
n = STDIN.gets.chomp().to_i

#create board
#board = Array.new
#(n*n).times { board << 'o' }

#puts board

if n.even?
  sm = (n/2) + 1
else
  sm = (n+1)/2
end
#puts sm

lg = n+1
#puts lg

#board[sm] == 'q'
#puts board[sm]
#poop = []
#board.map do |item|
#  if item == item[sm]
#    item == 'q'
#  end
#  poop << item
#end
#puts poop

#board = []
#while board.size <= (n*n)

#end
sm.to_i
lg.to_i
puts sm
puts lg#
#This approach is for building an array
board = ['o']
while board.size <= (n*n)
  if board.size == sm-1
    new_item = 'Queen'
  elsif board.size == sm + lg
    new_item = 'Queen'
  elsif board.size == sm + lg + sm 
    new_item = 'Queen'
  elsif board.size == sm + lg + sm + lg
    new_item = 'Queen'
  else
    new_item = 'o'
  end
  board << new_item
end

puts board

