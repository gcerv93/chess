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

  def initialize
    @board = Array.new(8) { Array.new(8, '') }
    # fill_board
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

  def inject_pawns
    board[1] = board[1].map.with_index { |_cell, idx| Pawn.new('white', [1, idx]) }
    board[6] = board[6].map.with_index { |_cell, idx| Pawn.new('black', [6, idx]) }
  end
end
