This program solves the n-queens problem.  Solving the problem requires
generating a chess board that has n rows and n columns, then position n
queens on that board in such a way that no queen is threatening another 
queen.

Traditionally, the user places all the queens on the first row of the 
board and moves each queen until it cannot attack any other queen.  I 
took a different approach.  Instead of moving queens, the programs simply
shows up at the finish line.  It determines the optimal locations for 
the queens and  simply places them there.  

This strategy allowed me to construct the chessboard as an array. For 
example, if n = 8, the program creates an array with 64 elements.  The array 
consists mostly asterisks, representing empty spaces, and "Q"s, marking queens'
locations.  Once a board with the solution has been generated, it is 
divided in subarrays consisting of n number of elements. This yields a 
result that resembles a chessboard.  Taking this array-based approach
saved me from having to generate logic addressing how queens traverse
rows and columns.  

To run the program, open your terminal and navigate to the root of the nqueen
directory.  Type "ruby arrange_queens.rb" and, when prompted, indicate what
number to use as n.

If you want to run the tests, you must have Rspec installed.  If you type "gem
install rspec," that should do the trick.
