# frozen_string_literal: true

# abstract superclass for piece objects
class Piece
  attr_accessor :moves, :location
  attr_reader :color

  def initialize(color, location)
    @color = color
    @location = location
    # this might not have to be an instance variable
    @moves = []
  end

  def ==(other)
    other.is_a?(Piece) ? color == other.color : false
  end
end
