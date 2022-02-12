# frozen_string_literal: true

require './lib/board'

# rubocop: disable Metrics/BlockLength
describe Board do
  describe '#initialize' do
    it 'creates the empty game_board' do
      board = Board.new(8, 8)
      expect(board.board.size).to be(8)
    end

    it 'accepts different sizes' do
      board = Board.new(16, 16)
      expect(board.board.size).to be(16)
    end
  end

  subject(:board) { described_class.new }
  describe '#setup_board' do
    before do
      board.instance_variable_set(:@pieces, {
                                    pawn: class_double(Pawn),
                                    rook: class_double(Rook),
                                    knight: class_double(Knight),
                                    bishop: class_double(Bishop),
                                    queen: class_double(Queen),
                                    king: class_double(King)
                                  })
      allow(board.pieces[:pawn]).to receive(:new)
      allow(board.pieces[:rook]).to receive(:new).and_return(an_instance_of(Rook))
      allow(board.pieces[:knight]).to receive(:new).and_return(an_instance_of(Knight))
      allow(board.pieces[:bishop]).to receive(:new).and_return(an_instance_of(Bishop))
      allow(board.pieces[:queen]).to receive(:new).and_return(an_instance_of(Queen))
      allow(board.pieces[:king]).to receive(:new).and_return(an_instance_of(King))
    end

    context 'sets up white pieces' do
      it 'sets up pawns' do
        pawn = an_instance_of(Pawn)
        allow(board.pieces[:pawn]).to receive(:new).and_return(pawn)
        board.setup_board
        expect(board.board[6][0]).to eq(pawn)
      end

      context 'sets up rooks' do
        it 'on left side' do
          rook = an_instance_of(Rook)
          allow(board.pieces[:rook]).to receive(:new).and_return(rook)
          board.setup_board
          left_end = board.board[7][0]
          expect(left_end).to eq(rook)
        end

        it 'on right side' do
          rook = an_instance_of(Rook)
          allow(board.pieces[:rook]).to receive(:new).and_return(rook)
          board.setup_board
          right_end = board.board[7][7]
          expect(right_end).to eq(rook)
        end
      end

      context 'sets up knights' do
        it 'on left side' do
          knight = an_instance_of(Knight)
          allow(board.pieces[:knight]).to receive(:new).and_return(knight)
          board.setup_board
          left_side = board.board[7][1]
          expect(left_side).to eq(knight)
        end

        it 'on right side' do
          knight = an_instance_of(Knight)
          allow(board.pieces[:knight]).to receive(:new).and_return(knight)
          board.setup_board
          right_side = board.board[7][6]
          expect(right_side).to eq(knight)
        end
      end

      context 'sets up bishops' do
        it 'on left side' do
          bishop = an_instance_of(Bishop)
          allow(board.pieces[:bishop]).to receive(:new).and_return(bishop)
          board.setup_board
          left_side = board.board[7][2]
          expect(left_side).to eq(bishop)
        end

        it 'on right side' do
          bishop = an_instance_of(Bishop)
          allow(board.pieces[:bishop]).to receive(:new).and_return(bishop)
          board.setup_board
          right_side = board.board[7][5]
          expect(right_side).to eq(bishop)
        end
      end

      it 'sets up white queen' do
        queen = an_instance_of(Queen)
        allow(board.pieces[:queen]).to receive(:new).and_return(queen)
        board.setup_board
        spot = board.board[7][3]
        expect(spot).to eq(queen)
      end

      it 'sets up white king' do
        king = an_instance_of(King)
        allow(board.pieces[:king]).to receive(:new).and_return(king)
        board.setup_board
        spot = board.board[7][4]
        expect(spot).to eq(king)
      end
    end

    context 'sets up black pieces' do
      it 'sets up pawns' do
        pawn = an_instance_of(Pawn)
        allow(board.pieces[:pawn]).to receive(:new).and_return(pawn)
        board.setup_board
        expect(board.board[1][0]).to eq(pawn)
      end

      context 'sets up rooks' do
        it 'on left side' do
          rook = an_instance_of(Rook)
          allow(board.pieces[:rook]).to receive(:new).and_return(rook)
          board.setup_board
          left_end = board.board[0][0]
          expect(left_end).to eq(rook)
        end

        it 'on right side' do
          rook = an_instance_of(Rook)
          allow(board.pieces[:rook]).to receive(:new).and_return(rook)
          board.setup_board
          right_end = board.board[0][7]
          expect(right_end).to eq(rook)
        end
      end

      context 'sets up black knights' do
        it 'on left side' do
          knight = an_instance_of(Knight)
          allow(board.pieces[:knight]).to receive(:new).and_return(knight)
          board.setup_board
          left_side = board.board[0][1]
          expect(left_side).to eq(knight)
        end

        it 'on right side' do
          knight = an_instance_of(Knight)
          allow(board.pieces[:knight]).to receive(:new).and_return(knight)
          board.setup_board
          right_side = board.board[0][6]
          expect(right_side).to eq(knight)
        end
      end

      context 'sets up black bishops' do
        it 'on left side' do
          bishop = an_instance_of(Bishop)
          allow(board.pieces[:bishop]).to receive(:new).and_return(bishop)
          board.setup_board
          left_side = board.board[0][2]
          expect(left_side).to eq(bishop)
        end

        it 'on right side' do
          bishop = an_instance_of(Bishop)
          allow(board.pieces[:bishop]).to receive(:new).and_return(bishop)
          board.setup_board
          right_side = board.board[0][5]
          expect(right_side).to eq(bishop)
        end
      end

      it 'sets up black queen' do
        queen = an_instance_of(Queen)
        allow(board.pieces[:queen]).to receive(:new).and_return(queen)
        board.setup_board
        spot = board.board[0][3]
        expect(spot).to eq(queen)
      end

      it 'sets up black king' do
        king = an_instance_of(King)
        allow(board.pieces[:king]).to receive(:new).and_return(king)
        board.setup_board
        spot = board.board[0][4]
        expect(spot).to eq(king)
      end
    end
  end

  # Starting move_piece test, update_later
  describe '#move_piece' do
    it 'sends the message to piece object' do
      piece = instance_double(Knight)
      allow(piece).to receive(:generate_moves)
      expect(piece).to receive(:generate_moves)
      board.move_piece(piece)
    end
  end
end

# rubocop: enable Metrics/BlockLength
