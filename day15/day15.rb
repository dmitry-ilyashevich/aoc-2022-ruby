# frozen_string_literal: true

require 'set'
require 'z3'

require_relative '../common'

class Day15BeaconExclusionZone < Day
  EXTENT_GAP = 2_000_000

  def part1
    impossible_x = Set.new
    beacons_in_row = Set.new

    lines.each do |line|
      sensor_x, sensor_y, beacon_x, beacon_y = parse_line(line)

      distance = manhattan_distance(sensor_x, sensor_y, beacon_x, beacon_y)
      extent = distance - (sensor_y - EXTENT_GAP).abs
      ((sensor_x - extent)...(sensor_x + extent + 1)).each do |xx|
        impossible_x.add(xx)
      end

      beacons_in_row.add(beacon_x) if beacon_y == EXTENT_GAP
    end

    impossible_x.size - beacons_in_row.size
  end

  def part2
    solver = Z3::Solver.new
    x = Z3.Int('x')
    y = Z3.Int('y')

    solver.assert(x >= 0)
    solver.assert(x < 4_000_000)
    solver.assert(y >= 0)
    solver.assert(y < 4_000_000)

    lines.each do |line|
      sensor_x, sensor_y, beacon_x, beacon_y = parse_line(line)

      distance = manhattan_distance(sensor_x, sensor_y, beacon_x, beacon_y)
      solver.assert(
        (
          Z3.IfThenElse(x - sensor_x >= 0, x - sensor_x, sensor_x - x) +
          Z3.IfThenElse(y - sensor_y >= 0, y - sensor_y, sensor_y - y)
        ) > distance
      )
    end

    return '' unless solver.satisfiable?

    model = solver.model
    model[x].to_i * 4_000_000 + model[y].to_i
  end

  private

  def parse_line(line)
    line.match(
      /Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/
    ).to_a.map(&:to_i)[1..]
  end

  def manhattan_distance(sensor_x, sensor_y, beacon_x, beacon_y)
    (sensor_x - beacon_x).abs + (sensor_y - beacon_y).abs
  end
end
