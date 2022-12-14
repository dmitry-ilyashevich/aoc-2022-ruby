# frozen_string_literal: true

require 'set'

require_relative '../common'

class Day14RegolithReservoir < Day
  def initialize(lines)
    super(lines)
    @rocks = parse_rocks
    @floor_y = fill_floor
  end

  def part1
    100_000.times do |index|
      rock = [500, 0]

      loop do
        return index if rock[1] + 1 >= @floor_y

        if !@rocks.include?([rock[0], rock[1] + 1])
          rock = [rock[0], rock[1] + 1]
        elsif !@rocks.include?([rock[0] - 1, rock[1] + 1])
          rock = [rock[0] - 1, rock[1] + 1]
        elsif !@rocks.include?([rock[0] + 1, rock[1] + 1])
          rock = [rock[0] + 1, rock[1] + 1]
        else
          break
        end
      end

      @rocks.add(rock)
    end
  end

  def part2
    100_000.times do |index|
      rock = [500, 0]

      loop do
        break if rock[1] + 1 >= @floor_y

        if !@rocks.include?([rock[0], rock[1] + 1])
          rock = [rock[0], rock[1] + 1]
        elsif !@rocks.include?([rock[0] - 1, rock[1] + 1])
          rock = [rock[0] - 1, rock[1] + 1]
        elsif !@rocks.include?([rock[0] + 1, rock[1] + 1])
          rock = [rock[0] + 1, rock[1] + 1]
        else
          break
        end
      end

      return index + 1 if rock == [500, 0]

      @rocks.add(rock)
    end
  end

  private

  def parse_rocks
    rocks = Set.new

    lines.each do |line|
      previous = nil

      line.split(' -> ').each do |rock|
        x, y = rock.split(',').map(&:to_i)

        if previous.nil?
          previous = [x, y]
          next
        end

        dx = x - previous[0]
        dy = y - previous[1]
        dlen = [dx.abs, dy.abs].max + 1

        dlen.times do |index|
          xx = previous[0] + index * sign(dx)
          yy = previous[1] + index * sign(dy)

          rocks.add([xx, yy])
        end

        previous = [x, y]
      end
    end

    rocks
  end

  def fill_floor
    floor_y = @rocks.map { |rock| rock[1] }.max + 2
    left_x = @rocks.map { |rock| rock[0] }.min - 1000
    right_x = @rocks.map { |rock| rock[0] }.max + 1000

    (left_x..right_x).each { |x| @rocks.add([x, @floor_y]) }

    floor_y
  end

  def sign(val)
    return 1 if val.positive?
    return -1 if val.negative?

    0
  end
end
