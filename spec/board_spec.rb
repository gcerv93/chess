# frozen_string_literal: true

require_relative '../lib/board'

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
  describe '#setup_trad_board' do
    context 'sets up white pieces' do
      it 'sets up white pawns' do
        board.setup_trad_board
        expect(board.board[1][0].is_a?(Pawn)).to eq(true)
        expect(board.board[1][5].is_a?(Pawn)).to eq(true)
        expect(board.board[1][3].is_a?(Pawn)).to eq(true)
      end

      it 'sets up white rooks' do
        board.setup_trad_board
        left_end = board.board[7][0]
        right_end = board.board[7][7]
        left_result = left_end.is_a?(Rook)
        right_result = right_end.is_a?(Rook)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
      end

      it 'sets up white knights' do
        board.setup_trad_board
        left_end = board.board[7][1]
        right_end = board.board[7][6]
        left_result = left_end.is_a?(Knight)
        right_result = right_end.is_a?(Knight)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
      end

      it 'sets up white bishops' do
        board.setup_trad_board
        left_end = board.board[7][2]
        right_end = board.board[7][5]
        left_result = left_end.is_a?(Bishop)
        right_result = right_end.is_a?(Bishop)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
      end

      it 'sets up white queen' do
        board.setup_trad_board
        queen = board.board[7][3]
        result = queen.is_a?(Queen)
        expect(result).to eq(true)
      end

      it 'sets up white king' do
        board.setup_trad_board
        king = board.board[7][4]
        result = king.is_a?(King)
        expect(result).to eq(true)
      end
    end

    context 'sets up black pieces' do
      it 'sets up black pawns' do
        board.setup_trad_board
        expect(board.board[6][0].is_a?(Pawn)).to eq(true)
        expect(board.board[6][5].is_a?(Pawn)).to eq(true)
        expect(board.board[6][3].is_a?(Pawn)).to eq(true)
      end

      it 'sets up black rooks' do
        board.setup_trad_board
        left_end = board.board[0][0]
        right_end = board.board[0][7]
        left_result = left_end.is_a?(Rook)
        right_result = right_end.is_a?(Rook)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
      end

      it 'sets up black knights' do
        board.setup_trad_board
        left_end = board.board[0][1]
        right_end = board.board[0][6]
        left_result = left_end.is_a?(Knight)
        right_result = right_end.is_a?(Knight)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
      end

      it 'sets up black bishops' do
        board.setup_trad_board
        left_end = board.board[0][2]
        right_end = board.board[0][5]
        left_result = left_end.is_a?(Bishop)
        right_result = right_end.is_a?(Bishop)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
      end

      it 'sets up black queen' do
        board.setup_trad_board
        queen = board.board[0][3]
        result = queen.is_a?(Queen)
        expect(result).to eq(true)
      end

      it 'sets up black king' do
        board.setup_trad_board
        king = board.board[0][4]
        result = king.is_a?(King)
        expect(result).to eq(true)
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength
