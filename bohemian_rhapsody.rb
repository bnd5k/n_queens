require_relative 'lib/nqueen.rb'

puts "How many queens are there?"
print '> '
n = gets.to_i

while  n < 4
  puts "No dice!  The n-queens problem is only solvable when n is greater than 3. Enter larger number below."
  print '> '
  n = gets.to_i
end

my_queen = Nqueen.new(n) 
puts "\n Here is the solution. \n"
puts my_queen.solve_puzzle
