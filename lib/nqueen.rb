class Nqueen
  EMPTY_SPACE_CHAR = '*'

  def initialize(n)
    @number_of_queens = n
  end

  def solve_puzzle
    # chops the solution array into sub-arrays of n size, then turns them into a string by joining them
    return "Problem not solvable." if @number_of_queens < 4
    solution_as_array = final_board.each_slice(@number_of_queens)
    output_board = ""
    answer_row =  solution_as_array.map{|row| row.join}
    output_board <<  answer_row.join("\n")
  end

  def location_of_first_queen
    if @number_of_queens.even?
      ( @number_of_queens / 2 ) + 1 
    else
      ( @number_of_queens + 1 ) / 2
    end
  end

  def interval_lengths
    #creates the two interval lengths necessary
    if @number_of_queens.even?
      sm_interval = @number_of_queens / 2
      lg_interval = ( @number_of_queens + 1 ) + sm_interval
    else
      sm_interval = ( @number_of_queens + 1 ) / 2
      lg_interval =  @number_of_queens + sm_interval
    end
    return sm_interval, lg_interval
  end

  def relative_position_of_queens
    #this method builds an array listing where the queens are located in
    #relation to one another.  The array is built by taking the position of the first queen and thenadding the interval lengths repeatedly (until the array is as big as it needs to be).
    first_queen = location_of_first_queen
    sm_interval, lg_interval = interval_lengths
    interval_sequence = [first_queen]
    ( @number_of_queens/2).times do
      interval_sequence << sm_interval
      interval_sequence << lg_interval
    end
    if @number_of_queens.even?
      interval_sequence.pop
    else
      interval_sequence
    end
    p interval_sequence
  end

  def board_positions_of_pre_queens
    # turns the interval sequence into a list of the positions prior to a queen.
    # (Knowing the positions prior to queens allows the programs to pop in
    # a Queen at the appropriate place.)
    interval_sequence = relative_position_of_queens
    queen_array = []
    interval_sequence.inject(0) do |sum, location|
      sum += location
      queen_array << sum - 1
      sum
    end
    queen_array
  end

  def final_board
    # generates array that contains the solution.  Q's representing where the queen's are positioned.
    queen_array = board_positions_of_pre_queens
    board = [EMPTY_SPACE_CHAR]
    while board.size < @number_of_queens ** 2
      if queen_array.include?(board.size)
        new_item = 'Q'
      else
        new_item = EMPTY_SPACE_CHAR
      end
      board << new_item
    end
    board
  end

end
