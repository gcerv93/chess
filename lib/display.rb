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

  def display_board
    n = 8
    board.each.with_index do |row, idx|
      print n
      row.each.with_index do |_cell, i|
        idx.even? ? print_even_rows(row[i].to_s, i) : print_odd_rows(row[i].to_s, i)
      end
      print "\n"
      n -= 1
    end
    puts '  A  B  C  D  E  F  G  H'
  end
end
