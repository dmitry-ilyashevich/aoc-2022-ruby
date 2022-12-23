# frozen_string_literal: true

require 'set'

require_relative '../common'

class Day23UnstableDiffusion < Day
  attr_accessor :lines, :grid

  OPTIONS = [
    [[0, -1], [1, -1], [-1, -1]],
    [[0, 1], [1, 1], [-1, 1]],
    [[-1, 0], [-1, 1], [-1, -1]],
    [[1, 0], [1, 1], [1, -1]]
  ].freeze

  def initialize(lines)
    super(lines)

    @grid = Set.new

    lines.each.with_index do |line, y|
      line.strip.split('').each.with_index do |c, x|
        next unless c == '#'

        @grid.add([x, y])
      end
    end

    calc
  end

  def part1
    @part1
  end

  def part2
    @part2
  end

  def calc
    return if @part1 && @part2

    i = 0
    loop do
      proposed = {}
      new_grid = Set.new

      grid.each do |(x, y)|
        unless surrounding(x, y)
          new_grid.add([x, y]) unless new_grid.include?([x, y])
          next
        end

        breaked = false
        4.times do |j|
          opt = OPTIONS[(i + j) % 4]

          next unless opt.all? { |dx, dy| !grid.include?([x + dx, y + dy]) }

          dx, dy = opt[0]

          proposed[x + dx] ||= {}
          proposed[x + dx][y + dy] ||= []
          proposed[x + dx][y + dy] << [x, y]
          breaked = true
          break
        end

        new_grid.add([x, y]) unless breaked
      end

      proposed.each do |px, p|
        p.each do |py, es|
          if es.size == 1
            new_grid.add([px, py])
          else
            new_grid.merge(es)
          end
        end
      end

      if grid == new_grid
        @part2 = i + 1
        break
      end

      @grid = new_grid.dup

      if i == 9
        minx = grid.map { |(x, _y)| x }.min
        miny = grid.map { |(_x, y)| y }.min
        maxx = grid.map { |(x, _y)| x }.max
        maxy = grid.map { |(_x, y)| y }.max

        width = maxx - minx + 1
        height = maxy - miny + 1

        @part1 = width * height - grid.size
      end

      i += 1
    end
  end

  private

  def surrounding(x, y)
    [-1, 0, 1].each do |dx|
      [-1, 0, 1].each do |dy|
        next if dx.zero? && dy.zero?

        return true if grid.include?([x + dx, y + dy])
      end
    end

    false
  end
end
