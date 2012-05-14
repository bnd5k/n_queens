#must accept argument for queens
#must create board based on # of queens.
#Maybe "How many queens are there?"  And then the value returned will be the board size
#
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


#new plan:
# when user inputs n, then generate an array of O's.  How many? n*n.
# then make the first entry in the array a 'q'
# or really, just make [0] a 'c', make [8] into a 'q', six times do add 8 to current
# position and convert that to 'c'].
#
# what is the logic behind rows?
# You could say that each array is a row.  Then you'd need n arrays.
#Then you have to worry about where the queen is in each array.  Need rules for how arrays
#can be scructured and those roles must be based off other arrays.
#
# row1 = Array[o,o,o,o]
# row2 = Array[q,o,o,o]
# row3 = Array[o,o,o,o]
# row4 = Array[o,o,o,o]

# Array[n+1]
# If row2[0] == 'q'
#   row1[0] == 'c'
#   row1[1] == 'c'
#
#   row2[1] == 'c'
#   row2[2] == 'c'
#   row2[3] == 'c'

#   row3[0] == 'c'
#   row3[1] == 'c'
#
#   row4[1] == 'c'
#   row3[3] == 'c'

#end
#There's gotta be a a rule where you actually change values.
# if 'q' is found in array, then convert all 'o's to 'c's.
#   And find the array no (e.g. [0], and for each array, change that corresponding number's
#   value to '0'. 
#   And find the diagonal by taking the position of q, adding 1, heading to the next array and then making that a c.
#   and turning it into  a new variable

# step 1 should always be to pop a value in row2, [0] 
# then, do an if statemenet, that says if there a q there, then block out all this other shit. (per code above)
# Then what? Maybe take note of where the queen in col 1 is and then start investigating col  2.
# 
# Put a q in row
#
# ary1 = o,o,o,o,o,o,o,o
# ary2 = o,o,o,o,o,o,o,o
# ary3 = o,o,o,o,o,o,o,o
# ary4 = o,o,o,o,o,o,o,o
# ary5 = o,o,o,o,o,o,o,o
# ary6 = o,o,o,o,o,o,o,o
# ary7 = o,o,o,o,o,o,o,o
# ary8 = o,o,o,o,o,o,o,o
# ary9 = o,o,o,o,o,o,o,o
#
#
