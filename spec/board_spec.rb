# frozen_string_literal: true

require_relative '../lib/board'

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
end
