# frozen_string_literal: true

require 'set'

require_relative '../common'

class Day17PyroclasticFlow < Day
  attr_accessor :jets, :lines

  BLOCK_SHAPES = [
    [[0, 0], [1, 0], [2, 0], [3, 0]],
    [[1, 0], [1, -1], [0, -1], [1, -2], [2, -1]],
    [[0, 0], [1, 0], [2, 0], [2, -1], [2, -2]],
    [[0, 0], [0, -1], [0, -2], [0, -3]],
    [[0, 0], [1, 0], [0, -1], [1, -1]]
  ].freeze

  BLOCK_WIDTHS = BLOCK_SHAPES.map do |block_shape|
    block_shape.map { |(x, _y)| x }.max + 1
  end.freeze

  def initialize(lines)
    super(lines)
    @jets = lines.first.strip.split('')
  end

  def part1
    calc(2022)
  end

  def part2
    calc(1_000_000_000_000)
  end

  private

  def calc(iterations)
    jets_enumerator = jets.each_with_index
    blocks_enumerator = BLOCK_SHAPES.each_with_index
    grid = Set[[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0]]

    min_y = 0
    seen = {}
    i = 0
    found_repeat = false

    while i < iterations
      block, block_index = begin
        blocks_enumerator.next
      rescue StopIteration
        blocks_enumerator.rewind.next
      end
      block_width = BLOCK_WIDTHS[block_index]

      jet, jet_index = begin
        jets_enumerator.next
      rescue StopIteration
        jets_enumerator.rewind.next
      end

      unless found_repeat
        (min_y...-1).each do |floor_y|
          next unless (0..6).all? { |x| grid.include?([x, floor_y]) }

          top = grid.select { |(_x, y)| y <= floor_y }.map { |(x, y)| [x, y - min_y] }.sort

          if seen.dig(top, block_index, jet_index)
            prev_index, prev_min_y = seen[top][block_index][jet_index]
            period = i - prev_index
            iters = (iterations - i) / period

            i += iters * period
            y_diff = prev_min_y - min_y
            min_y -= iters * y_diff
            gg = grid.to_a
            grid = Set.new
            gg.each { |(x, y)| grid.add([x, y - iters * y_diff]) }
            found_repeat = true
          end

          seen[top] ||= {}
          seen[top][block_index] ||= {}
          seen[top][block_index][jet_index] = [i, min_y]

          break
        end
      end

      xx = 2
      yy = min_y - 4

      loop do
        if jet == '<'
          xx -= 1 if xx.positive? && block.none? { |(xd, yd)| grid.include?([xx + xd - 1, yy + yd]) }
        elsif xx + block_width < 7 && block.none? { |(xd, yd)| grid.include?([xx + xd + 1, yy + yd]) }
          xx += 1
        end

        if block.any? { |(xd, yd)| grid.include?([xx + xd, yy + yd + 1]) }
          block.each { |(xd, yd)| grid.add([xx + xd, yy + yd]) }
          break
        end
        yy += 1

        jet, jet_index = begin
          jets_enumerator.next
        rescue StopIteration
          jets_enumerator.rewind.next
        end
      end

      min_y = grid.map { |(_x, y)| y }.min
      i += 1
    end

    -min_y
  end
end
