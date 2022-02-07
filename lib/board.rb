# frozen_string_literal: true

require 'colorize'
require_relative './display'
require_relative './pawn'
require_relative './rook'
require_relative './knight'
require_relative './bishop'
require_relative './queen'
require_relative './king'

# class for the board display
class Board
  include Display
  attr_accessor :board

  def initialize(rows = 8, cols = 8)
    @board = create_board(rows, cols)
  end

  # impliment UI at a later datee
  # def display_board
  #   colorize_board(board)
  #   n = 8
  #   board.each do |row|
  #     puts "#{n}  #{row[0]}#{row[1]}#{row[2]}#{row[3]}#{row[4]}#{row[5]}#{row[6]}#{row[7]}"
  #     n -= 1
  #   end
  #   puts '    A  B  C  D  E  F  G  H'
  # end

  def setup_trad_board
    white_pieces
    black_pieces
  end

  private

  def create_board(rows, cols)
    Array.new(rows) { Array.new(cols, '') }
  end

  def inject_pawns(color, row)
    board[row] = board[row].map.with_index { |_cell, idx| Pawn.new(color, [row, idx]) }
  end

  def inject_rooks(color, row, col = nil)
    if col
      board[row][col] = Rook.new(color, [row, col])
    else
      board[row][0] = Rook.new(color, [row, 0])
      board[row][7] = Rook.new(color, [row, 7])
    end
  end

  def inject_knights(color, row, col = nil)
    if col
      board[row][col] = Knight.new(color, [row, col])
    else
      board[row][1] = Knight.new(color, [row, 1])
      board[row][6] = Knight.new(color, [row, 6])
    end
  end

  def inject_bishops(color, row, col = nil)
    if col
      board[row][col] = Bishop.new(color, [row, col])
    else
      board[row][2] = Bishop.new(color, [row, 2])
      board[row][5] = Bishop.new(color, [row, 5])
    end
  end

  def inject_king(color, row, col = nil)
    if col
      board[row][col] = King.new(color, [row, col])
    else
      board[row][4] = King.new(color, [row, 4])
    end
  end

  def inject_queen(color, row, col = nil)
    if col
      board[row][col] = Queen.new(color, [row, col])
    else
      board[row][3] = Queen.new(color, [row, 3])
    end
  end

  def white_pieces
    inject_pawns('white', 6)
    inject_rooks('white', 7)
    inject_knights('white', 7)
    inject_bishops('white', 7)
    inject_queen('white', 7)
    inject_king('white', 7)
  end

  def black_pieces
    inject_pawns('black', 1)
    inject_rooks('black', 0)
    inject_knights('black', 0)
    inject_bishops('black', 0)
    inject_queen('black', 0)
    inject_king('black', 0)
  end
end
