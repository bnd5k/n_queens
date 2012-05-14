#so we've got an algorithm that workds like this
#on the basis of n being odd or even, create sm variable
#
puts "How many queens are there?"
print '> '
n = STDIN.gets.chomp().to_i

if n.even?
  #first = (n/2) + 1
  first = (n/2)
else
  #first  = (n+1)/2
  first  = ( (n+1)/2 ) - 1
end
first.to_i
#puts first

interval_1 = n/2
interval_2 = interval_1 + n+1
interval_1.to_i
interval_2.to_i


#need variable for first queen (currently, sm)
#
#need variable for each phase of algo

#This approach is for building an array
board = ['o']
while board.size < (n*n)
  if board.size == first 
    new_item = 'Queen'
  elsif board.size ==  first  + interval_1 
    new_item = 'Queen'
  elsif board.size == first + interval_1 + interval_2
    new_item = 'Queen'
  elsif board.size == first + interval_1 + interval_2 + interval_1
    new_item = 'Queen'
  else
    new_item = 'o'
  end
  board << new_item
end

puts board
puts board.size
