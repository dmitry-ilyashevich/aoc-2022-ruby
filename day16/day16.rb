# frozen_string_literal: true

require 'set'

require_relative '../common'
require_relative '../graph'

class Day16ProboscideaVolcanium < Day
  def part1
    graph_paths, rates = build_graph_paths

    do_step('AA', 'AA', 0, 100, graph_paths, rates, Set['AA'], 0, 30)
  end

  def part2
    graph_paths, rates = build_graph_paths

    do_step('AA', 'AA', 0, 0, graph_paths, rates, Set['AA'], 0, 26)
  end

  private

  def build_graph_paths
    rates = { 'AA' => 0 }
    graph = Graph.new

    lines.each do |line|
      words = line.strip.split(' ')
      from_name = words[1]
      rate = words[4][5..].to_i
      rates[from_name] = rate if rate.positive?

      words[9..].join('').split(',').each do |to_name|
        graph.add_edge(from_name, to_name, 1)
      end
    end

    graph_paths = {}
    rates.each_key do |from_edge|
      graph_paths[from_edge] = graph.shortest_paths(from_edge, rates.keys).map do |(name, distance)|
        [name, distance + 1]
      end
    end

    [graph_paths, rates]
  end

  def do_step(pos1, pos2, min1, min2, graph, rates, visited, flow, minutes)
    return flow if minutes.zero?

    if min1.positive? && min2.positive?
      return do_step(pos1, pos2, min1 - 1, min2 - 1, graph, rates, visited, flow, minutes - 1)
    end

    best = flow
    if min1.zero?
      found = false
      graph[pos1].each do |(to, dist)|
        next if dist >= minutes || visited.include?(to)

        found = true
        visited.add(to)
        result = do_step(
          to,
          pos2,
          dist,
          min2,
          graph,
          rates,
          visited,
          flow + rates[to] * (minutes - dist),
          minutes
        )
        visited.delete(to)
        best = result if result > best
      end

      return best if found
    end

    if min2.zero?
      graph[pos2].each do |(to, dist)|
        next if dist >= minutes || visited.include?(to)

        visited.add(to)
        result = do_step(
          pos1,
          to,
          min1,
          dist,
          graph,
          rates,
          visited,
          flow + rates[to] * (minutes - dist),
          minutes
        )
        visited.delete(to)
        best = result if result > best
      end
    end

    best
  end
end
