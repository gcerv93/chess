# frozen_string_literal: true

# abstract superclass for piece objects
class Piece
  attr_accessor :moves, :location
  attr_reader :color

  def initialize(color, location)
    @color = color
    @location = location
    @moves = []
  end
end
