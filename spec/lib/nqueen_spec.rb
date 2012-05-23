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

  describe '#solve_puzzle' do
    it 'should convert the solution array to a printable string' do
      game = Nqueen.new(4)
      example_final_board = ["*", "*", "Q", "*", "Q", "*", "*", "*", "*", "*", "*", "Q", "*", "Q", "*", "*"]
      game.stub(:final_board => example_final_board)
      game.solve_puzzle.should == "**Q*\nQ***\n***Q\n*Q**"
    end
  end

  describe '#location_of_first_queen' do
    it "should position the first queen when n is an even number" do
      game = Nqueen.new(4)
      game.location_of_first_queen.should == 3
    end

    it "should position the first queen when n is an odd number" do
      game = Nqueen.new(7)
      game.location_of_first_queen.should == 4
    end
  end
  
  describe '#length_of_intervals_between_queens' do
    it 'should calculate the intervals when there is an even number of queens' do
      game = Nqueen.new(4)
      game.length_of_intervals_between_queens.should == [2, 7]
    end

    it 'should calculate the intervals when there is an odd number of queens' do
      game = Nqueen.new(5)
      game.length_of_intervals_between_queens.should == [3, 8]
    end
  end

  describe '#relative_position_of_queens' do
    it 'should generate an array consisting of the first queen and alternating instances of the short and long interval' do
      game = Nqueen.new(8)
      location_of_first_queen = 5
      game.stub(:location_of_first_queen => location_of_first_queen)
      interval_lengths = [4, 13]
      game.stub(:interval_lengths => interval_lengths)
      game.relative_position_of_queens.should == [5,4,13,4,13,4,13,4,13]
    end
  end

  describe '#board_positions_prior_to_queens' do
    it 'should convert the sequence of intervals between queens into an array of the positions that precede a queen' do
      game = Nqueen.new(7)
      relative_position_of_queens = [4,4,11,4,11,4,11]
      game.stub(:relative_position_of_queens => relative_position_of_queens)
      game.board_positions_prior_to_queens.should == [3,7,18,22,33,37,48] 
    end
  end
  
  describe '#final_board' do
    it 'should generate the solution as an array of *s and Qs' do
      game = Nqueen.new(6)
      board_positions_prior_to_queens = [3, 6, 16, 19, 29, 32] 
      game.stub(:board_positions_prior_to_queens => board_positions_prior_to_queens)
      game.final_board.should == ["*", "*", "*", "Q", "*", "*", "Q", "*", "*", "*", "*", "*", "*", "*", "*", "*", "Q", "*", "*", "Q", "*", "*", "*", "*", "*", "*", "*", "*", "*", "Q", "*", "*", "Q", "*", "*", "*"]
    end
  end

end
