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

  describe 'will #solve_puzzle when it' do
    it 'converts the solution array to a printable string' do
      game = Nqueen.new(4)
      example_final_board = ["*", "*", "Q", "*", "Q", "*", "*", "*", "*", "*", "*", "Q", "*", "Q", "*", "*"]
      game.stub(:final_board => example_final_board)
      game.solve_puzzle.should == "**Q*\nQ***\n***Q\n*Q**"
    end
  end

  describe 'finds the #location_of_first_queen' do
    it "for an even number" do
      game = Nqueen.new(4)
      game.location_of_first_queen.should == 3
    end

    it "for an odd number" do
      game = Nqueen.new(7)
      game.location_of_first_queen.should == 4
    end
  end
  
  describe 'calculates the #length_of_intervals_between_queens' do
    it 'when there is an even number of queens' do
      game = Nqueen.new(4)
      game.length_of_intervals_between_queens.should == [2, 7]
    end

    it 'when there is an odd number of queens' do
      game = Nqueen.new(5)
      game.length_of_intervals_between_queens.should == [3, 8]
    end
  end

  describe 'calculates the #relative_position_of_queens by' do
    it 'generating an array consisting of the first queen and alternating instances of the short and long interval' do
      game = Nqueen.new(8)
      location_of_first_queen = 5
      game.stub(:location_of_first_queen => location_of_first_queen)
      interval_lengths = [4, 13]
      game.stub(:interval_lengths => interval_lengths)
      game.relative_position_of_queens.should == [5,4,13,4,13,4,13,4,13]
    end
  end

  describe 'converts a big array into a #tidy_array_of_relative_position_of_queens' do
    it 'when there is an even number of queens' do
      game = Nqueen.new(8)
      queen_position_array = [5,4,13,4,13,4,13,4,13]
      game.stub(:queen_position_array => queen_position_array)
      game.tidy_array_of_relative_position_of_queens.should == [5,4,13,4,13,4,13,4]
    end

    it 'when there is an odd number of queens' do
      game = Nqueen.new(5)
      relative_position_of_queens = [3,3,8,3,8]
      game.stub(:relative_position_of_queens  => relative_position_of_queens)
      game.tidy_array_of_relative_position_of_queens.should == [3,3,8,3,8] 
    end
  end

  describe 'lists #board_positions_prior_to_queens by' do
    it 'converting the sequence of intervals between queens into an array of the positions that precede a queen' do
      game = Nqueen.new(7)
      tidy_array_of_relative_position_of_queens= [4,4,11,4,11,4,11]
      game.stub(:tidy_array_of_relative_position_of_queens => tidy_array_of_relative_position_of_queens)
      game.board_positions_prior_to_queens.should == [3,7,18,22,33,37,48] 
    end
  end
  
  describe 'constructs the #final_board by' do
    it 'making a long array of *s and Qs' do
      game = Nqueen.new(6)
      board_positions_prior_to_queens = [3, 6, 16, 19, 29, 32] 
      game.stub(:board_positions_prior_to_queens => board_positions_prior_to_queens)
      game.final_board.should == ["*", "*", "*", "Q", "*", "*", "Q", "*", "*", "*", "*", "*", "*", "*", "*", "*", "Q", "*", "*", "Q", "*", "*", "*", "*", "*", "*", "*", "*", "*", "Q", "*", "*", "Q", "*", "*", "*"]
    end
  end

end
