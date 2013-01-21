#Jordan Hamel
#spec for chess.rb 

require 'rspec'
require_relative 'chess'

describe Chess do

	subject(:game) { Chess.new }

	describe "#populate_board" do
		it "fills the board with pieces in the correct places" do
			game.board[1][3].class.should eq(Pawn)
		end

		it "puts the correct colors on the correct sides" do
			game.board[1][3].color.should eq(:black)
		end
	end

	describe "#convert_move" do
		it "converts a move" do
			game.convert_move(['e4', 'b2']).should eq([[4, 4], [6, 1]])
		end
	end

	describe "#valid_move?" do

		#In rspec, will this run every line of valid_move? even if it is supposed
		#to return false partway through? In practice, valid_move works. But with
		#rspec, it seems to run checks even after the method has returned true or
		#false. I can explain this in person if the way I wrote it is confusing.

		it "returns false if you don't move anywhere" do
			game.valid_move?([1, 1], [1, 1], @black_player).should be(false)
		end

		it "returns false if you move off the board" do
			game.valid_move?([0, 8], [0, 9], @black_player).should be(false)
		end

		it "returns false if you move your opponents piece" do
			game.valid_move?([1, 0], [2, 0], @white_player).should be(false)
		end

		it "returns false if your piece can't move like that" do
			game.valid_move?([1, 0] , [4, 0], @black_player).should be(false)
		end

		it "returns false if there's something in your way" do
			game.valid_move?([0, 0], [0, 3], @black_player).should be(false)
		end
	end

end

describe Piece do 

	subject(:piece) { Piece.new(:black) }

	describe "#straight_path" do
		it "returns the positions in a straight path" do
			piece.straight_path([1, 0], [3, 0]).should eq([[2, 0]])
		end
	end

	describe "#diagonal_path" do
		it "returns the positions in a diagonal path" do
			piece.diagonal_path([0, 0], [2, 2]).should eq([[1, 1]])
		end
	end

end

describe King do
	subject(:king) { King.new(:black) }

	describe "#available_moves" do
		it "includes an available move" do
			king.available_moves([0, 0]).should include([0, 1])
		end

		it "doesn't include moves the king can't make" do
			king.available_moves([0, 0]).should_not include([2, 2])
		end
	end

end

describe Queen do
	subject(:queen) { Queen.new(:black) }

	describe "#available_moves" do
		it "includes an available move" do
			queen.available_moves([0, 0]).should include([2, 2])
		end

		it "doesn't include moves the queen can't make" do
			queen.available_moves([0, 0]).should_not include([2, 1])
		end
	end

end

describe Pawn do
	subject(:pawn) { Pawn.new(:black) }

	describe "#available_moves" do
		it "includes an available move" do
			pawn.available_moves([1, 0]).should include([3, 0])
		end

		it "doesn't include moves the pawn can't make" do
			pawn.available_moves([1, 0]).should_not include ([4, 0])
		end
	end

end

describe Rook do
	subject(:rook) { Rook.new(:black) }

	describe "#available_moves" do
		it "includes an available move" do
			rook.available_moves([0, 0]).should include([6, 0])
		end

		it "doesn't include mvoes the rook can't make" do
			rook.available_moves([0, 0]).should_not include([1, 1])
		end
	end

end

describe Knight do
	subject(:knight) { Knight.new(:black) }

	describe "#available_moves" do
		it "includes an available move" do
			knight.available_moves([0, 0]).should include([2, 1])
		end

		it "doesn't include moves the knight can't make" do
			knight.available_moves([0, 0]).should_not include([1, 1])
 		end
	end

end

describe Bishop do
	subject(:bishop) { Bishop.new(:black) }

	describe "#available_moves" do
		it "includes an available move" do
			bishop.available_moves([0, 0]).should include([5, 5])
		end

		it "doesn't include moves the bishop can't make" do
			bishop.available_moves([0, 0]).should_not include([0, 1])
		end
	end

end


