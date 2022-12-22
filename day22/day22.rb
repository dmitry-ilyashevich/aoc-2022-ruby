# frozen_string_literal: true

require_relative '../common'

class Day22MonkeyMap < Day
  attr_accessor :lines, :path, :grid

  DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]].freeze

  def initialize(lines)
    super(lines)

    @path = lines[-1].scan(/(\d+|L|R)/).map { |item| item[0] }

    @grid = {}
    lines[..-2].each.with_index do |line, y|
      line.rstrip.split('').each.with_index do |char, x|
        @grid[[x, y]] = char if char != ' '
      end
    end
  end

  def part1
    my = 0
    mx = grid.keys.select { |(_x, y)| y.zero? }.map { |(x, _y)| x }.min
    d = 0

    path.each do |p|
      if p == 'L'
        d = (d - 1) % 4
        next
      end

      if p == 'R'
        d = (d + 1) % 4
        next
      end

      p.to_i.times do
        dx = DIRS[d][0]
        dy = DIRS[d][1]
        nx = mx + dx
        ny = my + dy
        n = [nx, ny]
        nd = d

        unless grid.key?(n)
          nx = grid.keys.select { |(_x, y)| y == my }.map { |(x, _y)| x }.max if dx.negative?
          nx = grid.keys.select { |(_x, y)| y == my }.map { |(x, _y)| x }.min if dx.positive?

          ny = grid.keys.select { |(x, _y)| x == mx }.map { |(_x, y)| y }.max if dy.negative?
          ny = grid.keys.select { |(x, _y)| x == mx }.map { |(_x, y)| y }.min if dy.positive?

          n = [nx, ny]
        end

        break if grid[n] == '#'

        mx = nx
        my = ny
        d = nd
      end
    end

    (my + 1) * 1000 + 4 * (mx + 1) + d
  end

  # FIXME works only with user data
  def part2
    my = 0
    mx = grid.keys.select { |(_x, y)| y.zero? }.map { |(x, _y)| x }.min
    d = 0

    path.each do |p|
      if p == 'L'
        d = (d - 1) % 4
        next
      end

      if p == 'R'
        d = (d + 1) % 4
        next
      end

      p.to_i.times do
        dx = DIRS[d][0]
        dy = DIRS[d][1]
        nx = mx + dx
        ny = my + dy
        n = [nx, ny]
        nd = d

        unless grid.key?(n)
          if dx.negative?
            if my < 50
              nx = 0
              ny = 149 - my
              nd = 0
            elsif my < 100
              nx = my - 50
              ny = 100
              nd = 1
            elsif my < 150
              nx = 50
              ny = 49 - (my - 100)
              nd = 0
            else
              nx = 50 + my - 150
              ny = 0
              nd = 1
            end
          end

          if dx.positive?
            if my < 50
              nx = 99
              ny = 149 - my
              nd = 2
            elsif my < 100
              nx = 100 + my - 50
              ny = 49
              nd = 3
            elsif my < 150
              nx = 149
              ny = 49 - (my - 100)
              nd = 2
            else
              nx = 50 + my - 150
              ny = 149
              nd = 3
            end
          end

          if dy.negative?
            if my.zero?
              if mx >= 50 && mx < 100
                nx = 0
                ny = 150 + mx - 50
                nd = 0
              elsif mx >= 100
                nx = mx - 100
                ny = 199
              end
            elsif my == 100
              ny = mx + 50
              nx = 50
              nd = 0
            end
          end

          if dy.positive?
            if my == 199
              nx = mx + 100
              ny = 0
              nd = 1
            elsif my == 149
              nx = 49
              ny = mx - 50 + 150
              nd = 2
            elsif my == 49
              nx = 99
              ny = mx - 100 + 50
              nd = 2
            end
          end

          n = [nx, ny]
        end

        break if grid[n] && grid[n] == '#'

        mx = nx
        my = ny
        d = nd
      end
    end

    (my + 1) * 1000 + 4 * (mx + 1) + d
  end
end
