# frozen_string_literal: true

require_relative '../common'

class Day06TuningTroubles < Day
  def part1
    unique_sequence_ends(4)
  end

  def part2
    unique_sequence_ends(14)
  end

  private

  def unique_sequence_ends(unique_sequence_size)
    lines.each.with_object([]) do |line, res|
      coursor = 0
      while coursor < line.size - unique_sequence_size &&
            line[coursor..(coursor + unique_sequence_size - 1)].split('').uniq.size != unique_sequence_size
        coursor += 1
      end

      res << coursor + unique_sequence_size
    end
  end
end
