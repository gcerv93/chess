# frozen_string_literal: true

require 'colorize'

# class for the board object
class Board
  attr_accessor :board

  def initialize
    @board = create_checkered_board(Array.new(8) { Array.new(8) })
  end

  def display_board
    n = 8
    board.each do |row|
      puts "#{n}  #{row[0]}#{row[1]}#{row[2]}#{row[3]}#{row[4]}#{row[5]}#{row[6]}#{row[7]}"
      n -= 1
    end
    puts '    A  B  C  D  E  F  G  H'
  end

  private

  def create_checkered_board(board)
    board.each_with_index do |row, idx|
      row.each_with_index do |_cell, i|
        create_even_rows(board, idx, i) if idx.even?
        create_odd_rows(board, idx, i) if idx.odd?
      end
    end
  end

  def create_even_rows(board, row, index)
    board[row][index] = '   '.on_light_black if index.even?
    board[row][index] = '   '.on_light_magenta if index.odd?
  end

  def create_odd_rows(board, row, index)
    board[row][index] = '   '.on_light_magenta if index.even?
    board[row][index] = '   '.on_light_black if index.odd?
  end
end
