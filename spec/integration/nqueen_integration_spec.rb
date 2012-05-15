require 'rspec'
require './lib/nqueen.rb'

#mappings = {}
describe 'Nqeen' do

  it "outputs the correct array" do
    test = Nqueen.new(4)
    #puts test.public_methods(false).inspect
    test.determine_location_of_first_queen.should == 3
  end

  it "displays the state of the chessboard" do
    test = Nqueen.new(5)
    output_string = <<-STR
**Q**
Q****
***Q*
*Q***
****Q
STR
    test.solve_puzzle.should == output_string
  end

end

