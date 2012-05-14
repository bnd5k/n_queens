#so we've got an algorithm that workds like this
#on the basis of n being odd or even, create sm variable
#
puts "How many queens are there?"
print '> '
n = STDIN.gets.chomp().to_i

if n < 4
  puts "No dice!  The NQueen problem is only solvable when n >  3"
  exit
end

#set up variables
if n.even?
  first_queen_in_array = (n/2)+1
  sm_intv = n/2
  lg_intv = (n+1) + sm_intv
else
  first_queen_in_array = (n+1)/2
  sm_intv = (n+1)/2
  lg_intv = (n) + sm_intv
end
  first_queen_in_array.to_i

#determine interval
#This strategy provides an extra number in the array that isn't used but it's no biggies
my_intv = 1
queen_array = [first_queen_in_array]

(n/2).times do
    queen_array << sm_intv
    queen_array << lg_intv
end
#puts queen_array # => [3,2, 7,2]

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
board = ['*']
while board.size < (n*n)
  if qe2.include?(board.size)
    new_item = 'Q'
  else
    new_item = '*'
  end
  board << new_item
end
my_board = board.each_slice(n).to_a
#print board
my_board.each do |sub_array|
  nub = sub_array.join
  puts nub
end

