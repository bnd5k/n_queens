class Nqueen
  def initialize(n)
    #creates 3 key peices of info: where the first queen belongs and two
    #interval lengths.
    if n.even?
      @first_queen_in_array = (n/2)+1 
      @sm_interval = n/2
      @lg_interval = (n+1) + @sm_interval
    else
      @first_queen_in_array = (n+1)/2
      @sm_interval = (n+1)/2
      @lg_interval = (n) + @sm_interval
    end
  end

  def determine_intervals_between_queens(n)
    #my algo consists of alternating invertals, one large, on small. This method generates that interval sequence as an array
    @interval_sequence = [@first_queen_in_array]
    (n-1).times do
      @interval_sequence << @sm_interval
      @interval_sequence << @lg_interval
    end
  end

  def translate_intervals_into_board_positions(n)
    # turns the interval sequence into a list of the positions--not of queens, but of positions prior to a quee..
    # (Why the position prior? That's because the construct_solution_array  method relies on the position already being included in the array.)
    @queen_array = []
    sum = 0
    @interval_sequence.each do |item|
      sum += item  
      @queen_array << sum-1 
    end
  end

  def construct_solution_array(n)
    # generates array that contains the solution.  Q's representing where the queen's are positioned.
    @board = ['*']
    while @board.size < (n*n)
      if @queen_array.include?(@board.size)
        new_item = 'Q'
      else
        new_item = '*'
      end
      @board << new_item
    end
  end
  
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
end
