# frozen_string_literal: true

require_relative './piece'

# class for the game bishops
class Bishop < Piece
  def to_s
    @color == 'white' ? " \u265d ".bold : " \u265d ".black
  end
end
