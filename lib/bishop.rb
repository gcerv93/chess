# frozen_string_literal: true

# class for the game rooks
class Bishop
  # initialize with instance variable @color to track color of pieces
  def initialize(color)
    @color = color
  end

  def to_s
    @color == 'white' ? "\u265d".bold : "\u265d".black
  end
end
