# frozen_string_literal: true

require_relative '../common'

class Day01CaloriesCount < Day
  def part1
    calories_per_elf(lines).max
  end

  def part2
    calories_per_elf(lines).max(3).sum
  end

  private

  def calories_per_elf(lines)
    index = 0

    lines.each_with_object([0]) do |line, res|
      line.strip!

      if line.empty?
        index += 1
        res[index] = 0
      else
        res[index] += line.to_i
      end
    end
  end
end
