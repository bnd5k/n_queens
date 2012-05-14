class Nqueen

  def initialize(n)
    if n.even?
      first_queen_in_array = (n/2)+1
      @sm_intv = n/2
      @lg_intv = (n+1) + @sm_intv
    else
      first_queen_in_array = (n+1)/2
      @sm_intv = (n+1)/2
      @lg_intv = (n) + @sm_intv
    end
    @first_queen_in_array = first_queen_in_array.to_i
  end

  def determine_intervals_between_queens(n)
    @interval_sequence = [@first_queen_in_array]
    (n/1).times do
      @interval_sequence << @sm_intv
      @interval_sequence << @lg_intv
    end
    #puts @interval_sequence #=> [3,2, 7,2]
  end

  def translate_intervals_into_board_positions(n)
    # takes the interval sequence and turns it into an array of where the queens should be positioned. 
    # Note: the tranlsated interval sequence ultimately yields a list of the positions that are prior to where a queen will go.
    # That's because the construct_solution_board method relies on the position alread being included in the array
    @queen_array = []
    sum = 0
    @interval_sequence.each do |item|
      sum = sum + item  
      @queen_array << sum-1 
    end
    #puts @queen_array #=> [3,5,12,14]
  end

  def initial_state_of_chessboard(n)
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

  def construct_solution_board(n)
    puts "\n Here is the solution. \n"
    board = ['*']
    while board.size < (n*n)
      if @queen_array.include?(board.size)
        new_item = 'Q'
      else
        new_item = '*'
      end
      board << new_item
    end
    my_board = board.each_slice(n).to_a
    #print board
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
my_queen.initial_state_of_chessboard(n)
my_queen.construct_solution_board(n)

