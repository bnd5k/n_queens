require 'rspec'
require './lib/nqueen.rb'

mappings = { 
            4 => "**Q*\nQ***\n***Q\n*Q**",
            5 => "**Q**\nQ****\n***Q*\n*Q***\n****Q\n"
            }
describe 'Nqueen' do

  it "outputs the correct position of the first queen" do
    test = Nqueen.new(5)
    test.determine_location_of_first_queen.should == 3
    
  end

  mappings.each do |num, solution|         
    it "displays the Queens correctly on an n by n chessboard" do
      test = Nqueen.new(num)
      test.solve_puzzle.should == solution
    end
  end
end
