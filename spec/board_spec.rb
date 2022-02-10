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
  describe '#setup_board' do
    context 'sets up white pieces' do
      it 'sets up white pawns' do
        board.setup_board
        color = board.board[7][0].instance_variable_get(:@color)
        expect(board.board[6][0].is_a?(Pawn)).to eq(true)
        expect(board.board[6][5].is_a?(Pawn)).to eq(true)
        expect(board.board[6][3].is_a?(Pawn)).to eq(true)
        expect(color).to eq('white')
      end

      it 'sets up white rooks' do
        board.setup_board
        left_end = board.board[7][0]
        right_end = board.board[7][7]
        color = board.board[7][7].instance_variable_get(:@color)
        left_result = left_end.is_a?(Rook)
        right_result = right_end.is_a?(Rook)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
        expect(color).to eq('white')
      end

      it 'sets up white knights' do
        board.setup_board
        left_end = board.board[7][1]
        right_end = board.board[7][6]
        color = board.board[7][6].instance_variable_get(:@color)
        left_result = left_end.is_a?(Knight)
        right_result = right_end.is_a?(Knight)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
        expect(color).to eq('white')
      end

      it 'sets up white bishops' do
        board.setup_board
        left_end = board.board[7][2]
        right_end = board.board[7][5]
        color = board.board[7][5].instance_variable_get(:@color)
        left_result = left_end.is_a?(Bishop)
        right_result = right_end.is_a?(Bishop)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
        expect(color).to eq('white')
      end

      it 'sets up white queen' do
        board.setup_board
        queen = board.board[7][3]
        color = board.board[7][3].instance_variable_get(:@color)
        result = queen.is_a?(Queen)
        expect(result).to eq(true)
        expect(color).to eq('white')
      end

      it 'sets up white king' do
        board.setup_board
        king = board.board[7][4]
        color = board.board[7][4].instance_variable_get(:@color)
        result = king.is_a?(King)
        expect(result).to eq(true)
        expect(color).to eq('white')
      end
    end

    context 'sets up black pieces' do
      it 'sets up black pawns' do
        board.setup_board
        color = board.board[1][0].instance_variable_get(:@color)
        expect(board.board[1][0].is_a?(Pawn)).to eq(true)
        expect(board.board[1][5].is_a?(Pawn)).to eq(true)
        expect(board.board[1][3].is_a?(Pawn)).to eq(true)
        expect(color).to eq('black')
      end

      it 'sets up black rooks' do
        board.setup_board
        left_end = board.board[0][0]
        right_end = board.board[0][7]
        color = board.board[0][7].instance_variable_get(:@color)
        left_result = left_end.is_a?(Rook)
        right_result = right_end.is_a?(Rook)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
        expect(color).to eq('black')
      end

      it 'sets up black knights' do
        board.setup_board
        left_end = board.board[0][1]
        right_end = board.board[0][6]
        color = board.board[0][6].instance_variable_get(:@color)
        left_result = left_end.is_a?(Knight)
        right_result = right_end.is_a?(Knight)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
        expect(color).to eq('black')
      end

      it 'sets up black bishops' do
        board.setup_board
        left_end = board.board[0][2]
        right_end = board.board[0][5]
        color = board.board[0][5].instance_variable_get(:@color)
        left_result = left_end.is_a?(Bishop)
        right_result = right_end.is_a?(Bishop)
        expect(left_result).to eq(true)
        expect(right_result).to eq(true)
        expect(color).to eq('black')
      end

      it 'sets up black queen' do
        board.setup_board
        queen = board.board[0][3]
        color = board.board[0][3].instance_variable_get(:@color)
        result = queen.is_a?(Queen)
        expect(result).to eq(true)
        expect(color).to eq('black')
      end

      it 'sets up black king' do
        board.setup_board
        king = board.board[0][4]
        color = board.board[0][4].instance_variable_get(:@color)
        result = king.is_a?(King)
        expect(result).to eq(true)
        expect(color).to eq('black')
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength
