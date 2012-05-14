class Nqueen

  def initialize(n)
    if n.even?
      @first_queen_in_array = (n/2)+1 
      @sm_intv = n/2
      @lg_intv = (n+1) + @sm_intv
    else
      @first_queen_in_array = (n+1)/2
      @sm_intv = (n+1)/2
      @lg_intv = (n) + @sm_intv
    end
  end

  def determine_intervals_between_queens(n)
    #my algo consists of alternating invertals, one large, on small. This method generates that interval sequence as an array
    @interval_sequence = [@first_queen_in_array]
    (n-1).times do
      @interval_sequence << @sm_intv
      @interval_sequence << @lg_intv
    end
  end

  def translate_intervals_into_board_positions(n)
    # turns the interval sequence into a list of the positions--not of queens, but of positions prior to a quee..
    # (Why the position prior? That's because the construct_solution_array  method relies on the position already being included in the array.)
    @queen_array = []
    sum = 0
    @interval_sequence.each do |item|
      sum = sum + item  
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
    n.times  {print 'Q'}
    print " \n"
    (n-1).times do 
      n.times do
        print '*' 
      end
      print "  \n"
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

puts "How many queens are there?"
print '> '
n = STDIN.gets.chomp().to_i

if n < 4
  puts "No dice!  The NQueen problem is only solvable when n >  3"
  exit
end
my_queen = Nqueen.new(n)
my_queen.determine_intervals_between_queens(n)
my_queen.translate_intervals_into_board_positions(n)
my_queen.construct_solution_array(n)
my_queen.initial_state_of_chessboard(n)
my_queen.terminal_state_of_chessboard(n)

