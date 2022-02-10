# frozen_string_literal: true

require_relative './piece'

# class for the game knights
class Knight < Piece
  def to_s
    @color == 'white' ? " \u265e ".bold : " \u265e ".black
  end
end
