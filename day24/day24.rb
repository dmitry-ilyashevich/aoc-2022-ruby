# frozen_string_literal: true

require 'set'

require_relative '../common'

DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]].freeze
BLIZZARDS = '>v<^'

class Blizzard
  attr_reader :x, :y

  def initialize(direction, x, y, width, height)
    @width = width
    @height = height
    @direction = BLIZZARDS.index(direction)
    @x = x
    @y = y
  end

  def move
    dx, dy = DIRS[@direction]
    nx = @x + dx
    ny = @y + dy

    if nx >= 0 && nx < @width && ny >= 0 && ny < @height
      @x = nx
      @y = ny
    elsif @direction.zero?
      @x = 0
    elsif @direction == 1
      @y = 0
    elsif @direction == 2
      @x = @width - 1
    else
      @y = @height - 1
    end
  end
end

class Day24BlizzardBasin < Day
  attr_accessor :lines, :grid, :width, :height, :blizzards

  def initialize(lines)
    super(lines)

    @grid = lines[1...-1].each.with_object([]) do |line, res|
      res << line.strip.split('')[1...-1]
    end

    @width = grid[0].size
    @height = grid.size
    @blizzards = []

    @grid.each.with_index do |line, y|
      line.each.with_index do |c, x|
        @blizzards << Blizzard.new(c, x, y, width, height) if BLIZZARDS.include?(c)
      end
    end

    @start = [0, -1]
    @target = [@width - 1, @height]
  end

  def part1
    shortest_path(@start, @target)
  end

  def part2
     part1 + shortest_path(@target, @start) + shortest_path(@start, @target)
  end

  private

  def shortest_path(start, target)
    pos = [start]

    i = 0
    loop do
      free = Set.new
      height.times do |y|
        width.times do |x|
          free.add([x, y])
        end
      end
      free.add(start)
      free.add(target)

      blizzards.each do |b|
        b.move
        free.delete([b.x, b.y])
      end

      new_pos = Set.new

      pos.each do |(px, py)|
        new_pos.add([px, py])
        DIRS.each do |(dx, dy)|
          new_pos.add([px + dx, py + dy])
        end
      end

      pos = new_pos & free

      return i + 1 if pos.include?(target)

      i += 1
    end
  end
end
