# frozen_string_literal: true

require './lib/piece'

# class for the game pawns
class Pawn < Piece
  def to_s
    @color == 'white' ? " \u265f ".bold : " \u265f ".black
  end
end
