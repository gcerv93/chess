# frozen_string_literal: true

# abstract superclass for piece objects
class Piece
  def initialize(color, location)
    @color = color
    @location = location
  end
end
