# frozen_string_literal: true

require 'set'

require_relative '../common'

class Day13DistressSignal < Day
  def initialize(lines)
    super(lines)
    @data = parse_packets
  end

  def part1
    acc = 0

    @data.each_slice(2).with_index do |(packet1, packet2), index|
      acc += 1 + index if compare(packet1, packet2) == -1
    end

    acc
  end

  def part2
    @data.append([2])
    @data.append([6])

    @data.sort! { |l, r| compare(l, r) }

    acc = 1
    @data.each.with_index do |packet, index|
      acc *= index + 1 if packet == [2] || packet == [6]
    end

    acc
  end

  private

  def parse_packets
    lines.each_with_object([]) do |line, res|
      next if line.strip.empty?

      res << eval(line)
      res
    end
  end

  def compare(packet1, packet2)
    if packet1.is_a?(Numeric) && packet2.is_a?(Numeric)
      return 0 if packet1 == packet2
      return -1 if packet1 < packet2

      1
    elsif packet1.is_a?(Array) && packet2.is_a?(Array)
      i = 0

      while i < packet1.size && i < packet2.size
        c = compare(packet1[i], packet2[i])
        return c if c != 0

        i += 1
      end

      return -1 if i == packet1.size && i < packet2.size
      return 1 if i == packet2.size && i < packet1.size

      0
    elsif packet1.is_a?(Array) && packet2.is_a?(Numeric)
      compare(packet1, [packet2])
    elsif packet1.is_a?(Numeric) && packet2.is_a?(Array)
      compare([packet1], packet2)
    end
  end
end
