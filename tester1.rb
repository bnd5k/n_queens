#so we've got an algorithm that workds like this
#on the basis of n being odd or even, create sm variable
#
puts "How many queens are there?"
print '> '
n = STDIN.gets.chomp().to_i

if n.even?
  #first = (n/2) + 1
  first_queen_in_array = (n/2)
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
#puts first

interval_1 = n/2
interval_2 = interval_1 + n+1
interval_1.to_i
interval_2.to_i
#need a way to determine each interval 

#how do I get the interval to repeat or iterate over and over again n times?
#you really need to be counting the array size all the time and adding in "q" at teh appropriate
#I say, create the "hot" positions in one method and use them in another.
# Once the board adday gets to a size listed in 

#create an array that consists of sm_intv and lg_intv over and over again, n times
#then, in a new array, start with first_queen_in_array, add that to sm_intv, and then join that to the array.


queen_array = [first_queen_in_array]
(n-1).times do
  queen_array << sm_intv
  queen_array << lg_intv 
end
#puts queen_array # => [3,2, 7,2]

# qe2 takes the intervals from above and turns it into an array that lists where queens should be on the board.
#queen_array = [3,2, 7,2]
qe2 = []
sum = 0
queen_array.each do |item|
  sum = sum + item  
  qe2 << sum-1 #minus 1 is there because of the inlcude? method below. That method verifies that a number (board.size) is already in the array.  I offset the sequence by 1 so that queens appear where they're supposed be.
end
puts qe2 # =>  [3,5,12,14]
#queen_array.inject(first_queen_in_array) do |sum, num|
#   sum + num
#end
  #
#queen_array = []
# we need to add the intv to itself...how?
# really, we need to take the first_queen_in_the_array, then add sm_intv, th
# this is a perfect situation for inject
# 
#end
#puts queen_array

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
