# frozen_string_literal: true

require 'set'

require_relative '../common'

class Day20GrovePositioningSystem < Day
  def part1
    decrypt(lines, 1)
  end

  def part2
    decrypt(lines.map { |line| line.to_i * 811_589_153 }, 10)
  end

  def decrypt(message, repeat)
    original = message.map.with_index { |n, i| [i, n.to_i] }
    message = original.dup

    repeat.times do
      original.each do |num|
        i = message.index(num)

        message.delete(num)
        target_index = (i + num[1]) % message.size
        message.insert(target_index, num)
      end
    end

    zero = message.map(&:last)[0]

    [1000, 2000, 3000].map do |i|
      message[(zero + i) % message.size][1]
    end.sum
  end
end
