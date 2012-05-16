require 'rspec'
require './lib/nqueen.rb'

describe 'Nqueen' do
  describe 'spaces out Queens' do
    it "only when there are more than 3 queens" do
      Nqueen.new(3).solve_puzzle.should == "Problem not solvable."
    end

    it "on a 4 by 4 chessboard" do
      Nqueen.new(4).solve_puzzle.should == "**Q*\nQ***\n***Q\n*Q**"
    end

    it "on a 5 by 5 chessboard" do
      Nqueen.new(5).solve_puzzle.should == "**Q**\nQ****\n***Q*\n*Q***\n****Q"
    end
  end

  it "outputs the correct position of the first queen" do
    test = Nqueen.new(5)
    test.determine_location_of_first_queen.should == 3
  end

end
