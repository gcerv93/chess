# frozen_string_literal: true

# class for the board object
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8, '') }
  end

  def populate_board
    # TODO: populate board with chess pieces
  end

  def display_board
    board.each do |row|
      p row
    end
  end
end
