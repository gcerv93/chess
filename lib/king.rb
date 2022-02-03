# frozen_string_literal: true

# class for the game rooks
class King
  # initialize with instance variable @color to track color of pieces
  def initialize(color)
    @color = color
  end

  def to_s
    @color == 'white' ? "\u2654" : "\u265a"
  end
end
