# frozen_string_literal: true

require_relative '../common'

class Day25FullOfHotAir < Day
  WEIGHTS = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '-' => -1,
    '=' => -2
  }.freeze

  def part1
    i_to_snafu(lines.map { |line| snafu_to_i(line.strip) }.sum)
  end

  def snafu_to_i(value)
    value.split('').reverse.map.with_index do |char, index|
      WEIGHTS[char] * (5**index)
    end.sum
  end

  def i_to_snafu(value)
    result = []

    while value.positive?
      case value % 5
      when 0
        result << '0'
      when 1
        value -= 1
        result << '1'
      when 2
        value -= 2
        result << '2'
      when 3
        value += 2
        result << '='
      when 4
        value += 1
        result << '-'
      end

      value /= 5
    end

    result.reverse.join('')
  end
end
