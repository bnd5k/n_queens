#this method is for doing a find and replace on an array of o's
board.each do |item|
  if item.index = item[sm]
      item  = 'q'
    end
end    
# move to sm, convert to q, 
# move to lg, convert to q,
# to to lg, conervt to q,
# move to small, convert to q
#
# untill...when?  until the end of the array, I guess.  You'll have to define the array as
# haveing n*n members.


#
#This approach is for building an array
board = ['o']
while board.size < (n*n)
  if board.size ==  first_queen_in_array  
    new_item = 'Queen'
  elsif board.size ==  first_queen_in_array + interval_1 
    new_item = 'Queen'
  elsif board.size ==  first_queen_in_array + interval_1 + interval_2
    new_item = 'Queen'
  elsif board.size ==  first_queen_in_array + interval_1 + interval_2 + interval_1
    new_item = 'Queen'
  else
    new_item = 'o'
  end
  board << new_item
end
