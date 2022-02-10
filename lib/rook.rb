# frozen_string_literal: true

require './lib/piece'

# class for the game rooks
class Rook < Piece
  def to_s
    @color == 'white' ? " \u265c ".bold : " \u265c ".black
  end
end
