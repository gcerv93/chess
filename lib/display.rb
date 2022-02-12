# frozen_string_literal: true

# module for helping display board
module Display
  # helpers for coloring board
  def print_even_rows(string, index)
    print string.colorize(background: :white) if index.even?
    print string.colorize(background: :light_magenta) if index.odd?
  end

  def print_odd_rows(string, index)
    print string.colorize(background: :light_magenta) if index.even?
    print string.colorize(background: :white) if index.odd?
  end

  # rubocop: disable Metrics
  # This works for now. Is it too complex???
  def display_board(moves = [])
    n = 8
    board.each.with_index do |row, idx|
      print n
      row.each.with_index do |_cell, i|
        # convert the object to a string. Assign it to a variable to keep track of
        # it during the current iteration
        spot = row[i].to_s

        # There's 3 include? checks here
        # The first one checks if the spot is included in the array of moves, and if its
        # a 3-whitespace-string. Only these spots get filled with pink circles
        # Remove from moves array for future checks
        if moves.include?([idx, i]) && spot == '   '
          spot = " \u25cf ".colorize(:light_red)
          moves.delete([idx, i])
        end

        # send the rows to the print methods. the unless check is for the spots that survived the
        # above include? check.
        idx.even? ? print_even_rows(spot, i) : print_odd_rows(spot, i) unless moves.include?([idx, i])

        # Those spots get handled here, where we print the spots skipped in the above unless check
        if moves.include?([idx, i])
          print spot.colorize(background: :light_red)
          moves.delete([idx, i])
        end
      end
      print "\n"
      n -= 1
    end
    puts '  A  B  C  D  E  F  G  H'
  end
end
# rubocop: enable Metrics
