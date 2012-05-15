require_relative 'lib/nqueen.rb'

puts "How many queens are there?"
print '> '
n = gets.to_i

while  n < 4
  puts "No dice!  The n-queens problem is only solvable when n is greater than 3"
  print '> '
  n = gets.to_i
end

my_queen = Nqueen.new(n) 
#my_queen.solve_puzzle

#def solve_puzzle
  my_queen.determine_location_of_first_queen
  my_queen.determine_interval_lengths
  my_queen.generate_alternating_sequence_of_intervals
  my_queen.translate_intervals_into_board_positions
  my_queen.construct_solution_array
  my_queen.terminal_state_of_chessboard
#end

