require_relative 'lib/solution.rb'

puts "How many queens are there?"
print '> '
n = gets.to_i

while  n < 4
  puts "No dice!  The NQueen problem is only solvable when n >  3"
  print '> '
  n = gets.to_i
end
my_queen = Nqueen.new(n)
my_queen.determine_intervals_between_queens(n)
my_queen.translate_intervals_into_board_positions(n)
my_queen.construct_solution_array(n)
my_queen.initial_state_of_chessboard(n)
my_queen.terminal_state_of_chessboard(n)

