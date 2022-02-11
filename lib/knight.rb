# frozen_string_literal: true

require './lib/piece'

# class for the game knights
class Knight < Piece
  def generate_moves
    find_moves_helper.each do |nums|
      move = []
      move << location[0] + nums[0]
      move << location[1] + nums[1]
      moves << move unless check_moves(move)
    end
    moves
  end

  # do i really need this?
  def clear_moves
    moves.clear
  end

  def to_s
    @color == 'white' ? " \u265e ".bold : " \u265e ".black
  end

  private

  def find_moves_helper
    [[-1, 2], [1, 2], [2, 1], [2, -1],
     [1, -2], [-1, -2], [-2, -1], [-2, 1]]
  end

  def check_moves(move)
    move.any?(&:negative?) || move.any? { |n| n > 7 }
  end
end
