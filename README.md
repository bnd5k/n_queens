This program solves a logic problem known as the n queens problem.  Solving 
the problem requires generating a chess board that has n rows and n columns, 
then positioning n queens on the board in such a way that no queen is threatening 
another queen.

Traditionally, the user places all the queens on the first row of the 
board and moves each queen until it cannot attack any other queen.  I 
took a different approach.  I figured that moving queens around a chessboard 
is how a human would do it, but that a computer program doesn't need to do 
it that way. For a computer program, showing up at the finish line is just 
as good as running the race. So instead of moving queens, the program 
determines the optimal locations for the queens and simply places them there.  

By using this "finish line approach," I was able to avoid generating the 
complex logic for having queens navigate through the rows and columns of a 
chessboard.  Although the solution looks similar to a chessboard, it is in 
fact an array.

To run the program, navigate to the root of the nqueens directory from inside 
your terminal and type "ruby bohemian_rhapsody.rb."