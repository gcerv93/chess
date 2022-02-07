# frozen_string_literal: true

# class for the game rooks
class Queen
  # initialize with instance variable @color to track color of pieces
  def initialize(color, location)
    @color = color
    @location = location
  end

  def to_s
    @color == 'white' ? "\u265b".bold : "\u265b".black
  end
end
