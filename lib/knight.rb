# frozen_string_literal: true

# class for the game rooks
class Knight
  # initialize with instance variable @color to track color of pieces
  def initialize(color, location)
    @color = color
    @location = location
  end

  def to_s
    @color == 'white' ? "\u265e".bold : "\u265e".black
  end
end
