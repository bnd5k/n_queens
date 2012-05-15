require 'rspec'
require './lib/solution.rb'

initial_queen_positions  = {
                            4 => [3, 2, 7] 
                            }
sm_interval = {
               4 => 2
              }

lg_interval = {
               4 => 7
              }

interval_values = {
                    4 => [3, 2, 7, 2]
                  }              
sequence_values = {
                    4 => "**Q*Q******Q*Q**" 
                  }

describe Nqueen do

  initial_queen_positions.each do |num, queen, sm_interval, lg_interval|
    it 'creates the first position of a queen ' do
      output = Nqueen.initialize(num)
      output.should == queen, sm_interval, lg_interval
    end
  end
  
  interval_values.each do |num, interval|
    it 'creates the correct interval sequence fo n queens' do
      output = Nqueen.determine_intervals_between_queens(num)
      output.should == interval
    end
  end

  sequence_values.each do |num, sequence|
    it 'creates the correct sequence for n queens' do
      output = Nqueen.construct_solution_array(num)
      output.should == sequence
    end
  end

end
