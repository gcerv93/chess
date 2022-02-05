# frozen_string_literal: true

# module for helping display board
module Display
  WHITE_KING = " \u265a ".bold
  WHITE_QUEEN = " \u265b ".bold
  WHITE_ROOK = " \u265c ".bold
  WHITE_KNIGHT = " \u265e ".bold
  WHITE_BISHOP = " \u265d ".bold
  WHITE_PAWN = " \u265f ".bold

  BLACK_KING = " \u265a ".black
  BLACK_QUEEN = " \u265b ".black
  BLACK_ROOK = " \u265c ".black
  BLACK_BISHOP = " \u265d ".black
  BLACK_KNIGHT = " \u265e ".black
  BLACK_PAWN = " \u265f ".black

  def colorize_board(board)
    board.each_with_index do |row, idx|
      row.each_with_index do |_cell, i|
        colorize_even_rows(board, idx, i) if idx.even?
        colorize_odd_rows(board, idx, i) if idx.odd?
      end
    end
  end

  # helpers for coloring board
  def colorize_even_rows(board, row, index)
    board[row][index] = board[row][index].colorize(background: :white) if index.even?
    board[row][index] = board[row][index].colorize(background: :light_magenta) if index.odd?
  end

  def colorize_odd_rows(board, row, index)
    board[row][index] = board[row][index].colorize(background: :light_magenta) if index.even?
    board[row][index] = board[row][index].colorize(background: :white) if index.odd?
  end

  def fill_board
    fill_rooks
    fill_knights
    fill_bishops
    fill_kings
    fill_queens
    fill_pawns
  end

  def fill_rooks
    board[0][0] = BLACK_ROOK
    board[0][7] = BLACK_ROOK
    board[7][0] = WHITE_ROOK
    board[7][7] = WHITE_ROOK
  end

  def fill_knights
    board[0][1] = BLACK_KNIGHT
    board[0][6] = BLACK_KNIGHT
    board[7][1] = WHITE_KNIGHT
    board[7][6] = WHITE_KNIGHT
  end

  def fill_bishops
    board[0][2] = BLACK_BISHOP
    board[0][5] = BLACK_BISHOP
    board[7][2] = WHITE_BISHOP
    board[7][5] = WHITE_BISHOP
  end

  def fill_kings
    board[0][4] = BLACK_KING
    board[7][4] = WHITE_KING
  end

  def fill_queens
    board[0][3] = BLACK_QUEEN
    board[7][3] = WHITE_QUEEN
  end

  def fill_pawns
    board[1].map! do |_cell|
      BLACK_PAWN
    end

    board[6].map! do |_cell|
      WHITE_PAWN
    end
  end
end
