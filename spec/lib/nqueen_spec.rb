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

  describe '#determine_location_of_first_queen' do
    it "for an even number" do
      game = Nqueen.new(6)
      game.determine_location_of_first_queen.should == 4
    end

    it "for an odd number" do
      game = Nqueen.new(5)
      game.determine_location_of_first_queen.should == 3
    end
  end

  describe '#final_board' do
    it 'generates the solution as an array' do
      game = Nqueen.new(4)
      board_positions_of_queens = [3,5,12,14]
      game.stub(:board_positions_of_queens => board_positions_of_queens)
      game.final_board.should == ["*", "*", "Q", "*", "Q", "*", "*", "*", "*", "*", "*", "Q", "*", "Q", "*", "*"]
    end
  end

  describe '#output_board' do
    it 'converts the solution array to a printable string' do
      game = Nqueen.new(4)
      example_final_board = ["*", "*", "Q", "*", "Q", "*", "*", "*", "*", "*", "*", "Q", "*", "Q", "*", "*"]
      game.stub(:final_board => example_final_board)
      game.output_board.should == "**Q*\nQ***\n***Q\n*Q**"
    end
  end
end
