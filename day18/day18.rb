# frozen_string_literal: true

require 'set'

require_relative '../common'

class Day18BoilingBoulders < Day
  attr_accessor :blocks, :lines

  def initialize(lines)
    super(lines)
    @blocks = load_blocks
  end

  def part1
    acc = 0

    @blocks.each do |block|
      free_neighbors(block) do |_, _|
        acc += 1
      end
    end

    acc
  end

  def part2
    @pockets = Set.new
    @outside = Set.new

    acc = 0
    @blocks.each do |block|
      free_neighbors(block) do |n, _|
        acc += 1 if !@pockets.include?(n) && (@outside.include?(n) || floodfill(n))
      end
    end

    acc
  end

  private

  def load_blocks
    b = Set.new

    lines.each do |line|
      block_coords = line.strip.split(',').map(&:to_i)

      b.add(block_coords)
    end

    b
  end

  def mins
    @mins ||= [
      blocks.map { |block| block[0] }.min,
      blocks.map { |block| block[1] }.min,
      blocks.map { |block| block[2] }.min
    ]
  end

  def maxs
    @maxs ||= [
      blocks.map { |block| block[0] }.max,
      blocks.map { |block| block[1] }.max,
      blocks.map { |block| block[2] }.max
    ]
  end

  def free_neighbors(block)
    3.times do |i|
      [-1, 1].each do |d|
        b = block.dup
        b[i] += d
        yield b, i unless blocks.include?(b)
      end
    end
  end

  def floodfill(cc)
    todo = [cc]
    connected = Set.new

    until todo.empty?
      c = todo.pop

      free_neighbors(c) do |n, i|
        if n[i] < mins[i] || n[i] > maxs[i]
          @outside.merge(connected)
          return true
        end

        unless connected.include?(n)
          connected.add(n)
          todo.append(n)
        end
      end
    end

    @pockets.merge(connected)
    false
  end
end
