# frozen_string_literal: true

require_relative './piece'

# class for the game queens
class Queen < Piece
  def to_s
    @color == 'white' ? " \u265b ".bold : " \u265b ".black
  end
end
