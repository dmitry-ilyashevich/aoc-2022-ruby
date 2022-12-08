# frozen_string_literal: true

require_relative '../common'

class Day08TreetopTreeHouse < Day
  attr_accessor :lines, :rows, :columns

  DIRECTIONS = [[-1, 0], [0, 1], [1, 0], [0, -1]].freeze

  def initialize(lines)
    @lines = lines.map { |line| line.strip.split('') }
    @rows = @lines.size
    @columns = @lines[0].size
  end

  def part1
    result = 0
    rows.times do |row|
      columns.times do |column|
        visible = false

        DIRECTIONS.each do |(dr, dc)|
          good_variant = true

          rc = row
          cc = column

          loop do
            rc += dr
            cc += dc

            break unless (0..rows - 1).cover?(rc) && (0..columns - 1).cover?(cc)

            good_variant = false if lines[rc][cc] >= lines[row][column]
          end

          visible = true if good_variant
        end

        result += 1 if visible
      end
    end

    result
  end

  def part2
    result = 0
    rows.times do |row|
      columns.times do |column|
        score = 1

        DIRECTIONS.each do |(dr, dc)|
          distance = 1

          rc = row + dr
          cc = column + dc

          loop do
            unless (0..rows - 1).cover?(rc) && (0..columns - 1).cover?(cc)
              distance -= 1
              break
            end

            break if lines[rc][cc] >= lines[row][column]

            distance += 1
            rc += dr
            cc += dc
          end

          score *= distance
        end

        result = [score, result].max
      end
    end

    result
  end
end
