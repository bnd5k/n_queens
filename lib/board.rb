  def initial_state_of_chessboard(n)
    #generates how the starting position of the chess board would look.
    puts "\n Here is the initial state of the chess board.\n"
    n.times  { print 'Q' }
    print "\n"
    (n-1).times do 
      n.times do
        print '*' 
      end
      print "\n"
    end
  end
  
  def terminal_state_of_chessboard(n)
    # chops the solution array into sub-arrays of n size, then turns them into a string by joining them
    puts "\n Here is the solution. \n"
    my_board = @board.each_slice(n).to_a
    my_board.each do |sub_array|
      nub = sub_array.join
      puts nub
    end
  end
