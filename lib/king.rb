# frozen_string_literal: true

require './lib/piece'

# class for the game kings
class King < Piece
  def to_s
    @color == 'white' ? " \u265a ".bold : " \u265a ".black
  end
end
