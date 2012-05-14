#so we've got an algorithm that workds like this
#on the basis of n being odd or even, create sm variable
#
puts "How many queens are there?"
print '> '
n = STDIN.gets.chomp().to_i

#setup variables
if n.even?
  #first = (n/2) + 1
  first_queen_in_array = (n/2)+1
  first_queen_in_array.to_i
  my_interval = n+1
  # you have n number of intervals
  sm_intv = n/2
  lg_intv = (n+1) + sm_intv

else
  #first  = (n+1)/2
  first  = ( (n+1)/2 ) - 1
end
first.to_i

#determine intervals
my_intv = 1
queen_array = [first_queen_in_array]

(n/2).times do
    queen_array << sm_intv
    queen_array << lg_intv
end
  #  queen_array << first_queen_in_array
  #  queen_array << sm_intv
  #  queen_array << lg_intv
  #  my_intv = 1
  #  puts my_intv
#  if my_intv = 1
#    queen_array << sm_intv
#    my_intv = 2
#  else my_intv = 2  
#    queen_array << lg_intv
#    my_intv = 1
#  end
# # puts queen_array
#end
puts queen_array # => [3,2, 7,2]

#translate intervals to positions on boad
# qe2 takes the intervals from above and turns it into an array that lists where queens should be on the board.
#queen_array = [3,2, 7,2]
qe2 = []
sum = 0
queen_array.each do |item|
  sum = sum + item  
  qe2 << sum-1 #minus 1 is there because of the inlcude? method below. That method verifies that a number (board.size) is already in the array.  I offset the sequence by 1 so that queens appear where they're supposed be.
end
#puts qe2 # =>  [3,5,12,14]

#now construct the board
board = ['o']
while board.size < (n*n)
  if qe2.include?(board.size)
    new_item = 'Queen'
  else
    new_item = 'o'
  end
  board << new_item
end


puts board
puts board.size
