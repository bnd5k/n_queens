class Nqueen
  EMPTY_SPACE_CHAR = '*'

  def initialize(n)
    @number_of_queens = n
  end

  def solve_puzzle
    # chops the solution array into sub-arrays of n size and turns each sub-array into a string
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

  def length_of_intervals_between_queens 
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
    #builds an array that lists where the queens are located in relation to one another
    first_queen = location_of_first_queen
    sm_interval, lg_interval = length_of_intervals_between_queens
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
    interval_sequence
  end

  def board_positions_prior_to_queens
    # (Knowing the positions prior to queens allows the final_board method to create an array with queens in the appropriate places. 
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
    # generates array consisting of *'s and Q's in the correct order
    pre_queen_array = board_positions_prior_to_queens 
    board = [EMPTY_SPACE_CHAR]
    while board.size < @number_of_queens ** 2
      if pre_queen_array.include?(board.size)
        new_item = 'Q'
      else
        new_item = EMPTY_SPACE_CHAR
      end
      board << new_item
    end
   board
  end

end
