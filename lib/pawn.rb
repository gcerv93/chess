# frozen_string_literal: true

# class for the game rooks
class Pawn
  # initialize with instance variable @color to track color of pieces
  def initialize(color)
    @color = color
  end

  def to_s
    @color == 'white' ? "\u2659" : "\u265f"
  end
end
