# frozen_string_literal: true

# class for the game rooks
class Queen
  # initialize with instance variable @color to track color of pieces
  def initialize(color)
    @color = color
  end

  def to_s
    @color == 'white' ? "\u2655" : "\u265b"
  end
end