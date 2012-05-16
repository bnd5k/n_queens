require 'rspec'
require './lib/nqueen.rb'

describe 'Nqueen' do
  describe 'positions the queens' do
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
      game.location_of_first_queen.should == 4
    end

    it "for an odd number" do
      game = Nqueen.new(5)
      game.location_of_first_queen.should == 3
    end
  end

  describe '#solve_puzzle' do
    it 'converts the solution array to a printable string' do
      game = Nqueen.new(4)
      example_final_board = ["*", "*", "Q", "*", "Q", "*", "*", "*", "*", "*", "*", "Q", "*", "Q", "*", "*"]
      game.stub(:final_board => example_final_board)
      game.solve_puzzle.should == "**Q*\nQ***\n***Q\n*Q**"
    end
  end
  
  describe '#board_positions_of_pre_queens' do
    it 'generates an array of the array positions that precede a queen' do
      game = Nqueen.new(4)
      sequence_of_intervals = [3,2,7,2]
      game.stub(:sequence_of_intervals => sequence_of_intervals)
      game.board_positions_of_pre_queens.should == [2, 4, 11, 13] 
    end
  end
  describe '#final_board' do
    it 'generates the solution as an array' do
      game = Nqueen.new(4)
      board_positions_of_pre_queens = [2, 4, 11, 13, 20, 22, 29] 
      game.stub(:board_positions_of_pre_queens => board_positions_of_pre_queens)
      game.final_board.should == ["*", "*", "Q", "*", "Q", "*", "*", "*", "*", "*", "*", "Q", "*", "Q", "*", "*"]
    end
  end

end
