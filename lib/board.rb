# frozen_string_literal: true

require 'colorize'
require './lib/display'
require './lib/pawn'
require './lib/rook'
require './lib/knight'
require './lib/bishop'
require './lib/queen'
require './lib/king'

# class for the board display
class Board
  include Display
  attr_accessor :board
  attr_reader :pieces

  def initialize(rows = 8, cols = 8)
    @board = create_board(rows, cols)
    @pieces = {
      pawn: Pawn,
      rook: Rook,
      knight: Knight,
      bishop: Bishop,
      queen: Queen,
      king: King
    }
  end

  def setup_board
    setup_white_pieces
    setup_black_pieces
  end

  private

  # create array with 3 blank spaces, for coloring of board
  def create_board(rows, cols)
    Array.new(rows) { Array.new(cols, '   ') }
  end

  def setup_pawns(color, row)
    board[row] = board[row].map.with_index { |_cell, idx| pieces[:pawn].new(color, [row, idx]) }
  end

  def setup_rooks(color, row)
    board[row][0] = pieces[:rook].new(color, [row, 0])
    board[row][7] = pieces[:rook].new(color, [row, 7])
  end

  def setup_knights(color, row)
    board[row][1] = pieces[:knight].new(color, [row, 1])
    board[row][6] = pieces[:knight].new(color, [row, 6])
  end

  def setup_bishops(color, row)
    board[row][2] = pieces[:bishop].new(color, [row, 2])
    board[row][5] = pieces[:bishop].new(color, [row, 5])
  end

  def setup_king(color, row)
    board[row][4] = pieces[:king].new(color, [row, 4])
  end

  def setup_queen(color, row)
    board[row][3] = pieces[:queen].new(color, [row, 3])
  end

  def setup_white_pieces
    setup_pawns('white', 6)
    setup_rooks('white', 7)
    setup_knights('white', 7)
    setup_bishops('white', 7)
    setup_queen('white', 7)
    setup_king('white', 7)
  end

  def setup_black_pieces
    setup_pawns('black', 1)
    setup_rooks('black', 0)
    setup_knights('black', 0)
    setup_bishops('black', 0)
    setup_queen('black', 0)
    setup_king('black', 0)
  end
end
