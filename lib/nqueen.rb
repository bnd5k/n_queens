class Nqueen

  def initialize(n)
    @number_of_queens = n
    @empty_space = '*'
  end

  def solve_puzzle
    determine_location_of_first_queen
    determine_interval_lengths
    generate_alternating_sequence_of_intervals
    translate_intervals_into_board_positions
    construct_solution_array
    terminal_state_of_chessboard
  end

  def determine_location_of_first_queen
    if @number_of_queens.even?
      @first_queen_in_array = ( @number_of_queens / 2 ) + 1 
    else
      @first_queen_in_array = ( @number_of_queens + 1 ) / 2
    end
  end

  def determine_interval_lengths
    #creates the two interval lengths necessary
    if @number_of_queens.even?
      @sm_interval = @number_of_queens / 2
      @lg_interval = ( @number_of_queens + 1 ) + @sm_interval
    else
      @sm_interval = ( @number_of_queens + 1 ) / 2
      @lg_interval =  @number_of_queens + @sm_interval
    end
  end

  def generate_alternating_sequence_of_intervals
    #my algo consists of alternating intervals, one large, on small. This method generates that interval sequence as an array
    @interval_sequence = [@first_queen_in_array]
    ( @number_of_queens - 1 ).times do
      @interval_sequence << @sm_interval
      @interval_sequence << @lg_interval
    end
  end

  def translate_intervals_into_board_positions
    # turns the interval sequence into a list of the positions--not of queens, but of positions prior to a queen.
    # (Why the position prior? That's because the construct_solution_array method relies on the position already being included in the array.)
    @queen_array = []
    @interval_sequence.inject(0) do |sum, location|
      sum += location
      @queen_array << sum - 1
      sum
    end
  end

  def construct_solution_array
    # generates array that contains the solution.  Q's representing where the queen's are positioned.
    @board = ['*']
    while @board.size < @number_of_queens * @number_of_queens
      if @queen_array.include?(@board.size)
        new_item = 'Q'
      else
        new_item = @empty_space
      end
      @board << new_item
    end
  end

  def terminal_state_of_chessboard
    # chops the solution array into sub-arrays of n size, then turns them into a string by joining them
    puts "\n Here is the solution. \n"
    solution_as_array = @board.each_slice(@number_of_queens)
    solution_as_array.each do |sub_array|
      puts sub_array.join
    end
  end

end
