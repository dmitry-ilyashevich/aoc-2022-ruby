# frozen_string_literal: true

require 'set'

require_relative '../common'

class Day12HillClimbingAlgorithm < Day
  attr_accessor :lines, :map
  attr_reader :start_position, :end_position

  DIRECTIONS = [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze

  def initialize(lines)
    super(lines)
    @map = lines.map { |line| line.strip.split('') }
    @start_position = find('S')
    @map[@start_position[0]][@start_position[1]] = 'a'
    @end_position = find('E')
    @map[@end_position[0]][@end_position[1]] = 'z'
  end

  def part1
    breadth_first_search([[@start_position, 0]])
  end

  def part2
    initial_queue = []
    map.each.with_index do |row, row_index|
      row.each.with_index do |column, column_index|
        initial_queue << [[row_index, column_index], 0] if column == 'a'
      end
    end

    breadth_first_search(initial_queue)
  end

  private

  def breadth_first_search(queue)
    visited_nodes = Set.new

    until queue.empty?
      node, depth = queue.shift
      next if visited_nodes.include? node

      visited_nodes.add(node)
      return depth if node[0] == end_position[0] && node[1] == end_position[1]

      DIRECTIONS.each do |(delta_row, delta_column)|
        possible_position = [node[0] + delta_row, node[1] + delta_column]

        next if possible_position[0].negative?
        next if possible_position[1].negative?
        next if possible_position[0] >= @map.size
        next if possible_position[1] >= @map[0].size
        next if map[possible_position[0]][possible_position[1]].ord > map[node[0]][node[1]].ord + 1

        queue.append([possible_position, depth + 1])
      end
    end
  end

  def find(symbol)
    @map.each.with_index do |line, row_position|
      line.each.with_index do |char, column_position|
        return row_position, column_position if char == symbol
      end
    end
  end
end
