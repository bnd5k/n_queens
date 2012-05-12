#must accept argument for queens
#must creat board based on # of queens.
#Maybe "How many queens are there?"  And then the value returned will be the board size
#
#initialize should
#1) setup the board
#2) set the queens in the same row
#
n = 8
#setup board
 n.times do 
    n.times do
      print '*' 
    end
    print " \n"
end
#replace row 1 with queens
 
n.times { print 'q' }

#queens problem is essentially a compbination of rook's problem and bishop's problem.  Must
#find solutions where board congifuration is same in both.
#
#What's the workflow of this program?
#based on an input, it creates a board
#then generates a solution
#then saves that solution?  or just outputs it to terminal?
#
# I suppose once there's a configuration that doesn't break the rule, then just output it to
# terminal.
# Wait...what's the rule?  Ulimtately, each board configuration must be generated and
# evaluated.
# Looks like we're dealing with an if/then or a for/loop.  "while winning_config = false
# do..."

#how do you define winning_config?
# 1)there can be no queens in the col.  
# 2) there can be no queens in the row
# 3) there can be no queens diagonally
#
#how to I setup a coordinate sytem??  It must understand how to move foward, backward,
#sideways and diagonally.
# probably need to define what a column is an what a row is.
# a row has n columns
#
#I guess you could just setup the board configuration as a single entity.

#row1 = ********
#row2 = ********

#So if the first item in in row1 == q and the first ite
# you could use n arrays.  And just setup a rule where if ther is a Q in [0] then all other
# arrays must be populated with *'s
# Initalially, the arrays will just be like this

my_array = [0..8]
puts my_array

#moving pieces = changing values in array.  


Rule: queen should only move up or down in the column.
  
