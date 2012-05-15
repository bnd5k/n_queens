require 'rspec'
require './lib/nqueen.rb'

initial_queen_positions  = {
                            4 => [3, 2, 7] 
                            }
intervals = {
               4 => [2,7]
              }


queen_pattern = {
                    4 => [3, 2, 7, 2]
                  }              

queen_location = {
                  4 => [3,5,12,14]  
                  }                  
                  
success_array_values = {
                    4 => "**Q*Q******Q*Q**" 
                  }





describe 'Nqueen' do

  initial_queen_positions.each do |num, queen|
    it 'determines the first position of a queen' do
      @number_of_queens = num
      output = Nqueen.determine_location_of_first_queen
      output.should == queen
    end
  end

  intervals.each do |num, small_interval, large_interval|
    it 'creates the first position of a queen ' do
      output = Nqueen.determine_interval_lengths(num)
      output.should.sm_intv  ==  small_interval
      output.should.lg_intv  ==  large_interval
    end
  end
  
  queen_pattern.each do |num, pattern|
    it 'creates the correct interval sequence fo n queens' do
      output = Nqueen.generate_alternating_sequence_of_intervals(num)
      output.should == pattern
    end
  end

  queen_location.each do |num, location|
    it 'turns the interval sequence into the correct board positions' do
      output = Nqueen.translate_intervals_into_board_positionsa(num)
      output.should == location
    end
  end

  success_array_values.each do |num, sequence|
    it 'creates the correct sequence for n queens' do
      output = Nqueen.construct_solution_array(num)
      output.should == sequence
    end
  end
  
#  final_board_apparance.each do |num, board |
#    it 'creates an n by n board' do
#      output = Nqueen.terminal_state_of_chessboard(num)
#      output.should == board
#    end
#  end
end
