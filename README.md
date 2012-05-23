This program solves the n queens problem.  Solving the problem requires
generating a chess board that has n rows and n columns, then positioning 
n queens on the board in such a way that no queen is threatening 
another queen.

Traditionally, the user places all the queens on the first row of the 
board and moves each queen until it cannot attack any other queen.  I 
took a different approach.  Instead of moving queens, the program 
determines the optimal locations for the queens and simply places them there.  

To run the program, navigate to the root of the nqueens directory from inside 
your terminal and type "ruby bohemian_rhapsody.rb."