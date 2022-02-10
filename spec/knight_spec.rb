# frozen_string_literal: true

require './lib/knight'

# rubocop: disable Metrics/BlockLength
describe Knight do
  subject(:knight) { described_class.new('white', [3, 3]) }

  describe '#generate_moves' do
    it 'generates a bunch of moves' do
      expect { knight.generate_moves }.to change(knight, :moves)
    end

    context 'when in the middle of the board' do
      it 'generates correct moves' do
        good_result = [[2, 5], [4, 5], [5, 4], [5, 2], [4, 1], [2, 1], [1, 2], [1, 4]].sort
        knight.generate_moves
        expect(knight.moves.sort).to eq(good_result)
      end
    end

    context 'when on the starting position' do
      it 'generates correct moves' do
        knight.instance_variable_set(:@location, [0, 1])
        knight.generate_moves
        good_result = [[2, 0], [2, 2], [1, 3]].sort
        expect(knight.moves.sort).to eq(good_result)
      end
    end
  end

  describe '#clear_moves' do
    it 'clears the moves' do
      knight.generate_moves
      expect { knight.clear_moves }.to change(knight, :moves).to eq([])
    end
  end
end
# rubocop: enable Metrics/BlockLength
