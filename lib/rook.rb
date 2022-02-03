# frozen_string_literal: true

# class for the game rooks
class Rook
  # initialize with instance variable @color to track color of pieces
  def initialize(color)
    @color = color
  end

  def to_s
    @color == 'white' ? "\u2656" : "\u265c"
  end
end
