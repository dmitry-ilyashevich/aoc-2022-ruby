# frozen_string_literal: true

require_relative '../common'

class Day04CampCleanup < Day
  def part1
    lines.inject(0) do |res, line|
      ranges = line.split(',')

      if ranges.size == 2
        ls, le = get_coordinate(ranges[0])
        rs, re = get_coordinate(ranges[1])

        res += 1 if (ls <= rs && le >= re) || (rs <= ls && re >= le)
      end

      res
    end
  end

  def part2
    lines.inject(0) do |res, line|
      ranges = line.split(',')

      if ranges.size == 2
        ls, le = get_coordinate(ranges[0])
        rs, re = get_coordinate(ranges[1])

        res += 1 if (le >= rs && le <= re) || (re >= ls && re <= le)
      end

      res
    end
  end

  private

  def get_coordinate(value)
    value.split('-').map(&:to_i)
  end
end
