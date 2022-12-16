class Graph
  attr_reader :graph, :nodes, :previous, :distance

  INFINITY = 1 << 64

  def initialize
    @graph = {}
    @nodes = []
  end

  def connect_graph(source, target, weight)
    if graph.key?(source)
      graph[source][target] = weight
    else
      graph[source] = { target => weight }
    end

    nodes << source unless nodes.include?(source)
  end

  def add_edge(source, target, weight)
    connect_graph(source, target, weight)
    connect_graph(target, source, weight)
  end

  def dijkstra(source)
    @distance = {}
    @previous = {}

    nodes.each do |node|
      @distance[node] = INFINITY
      @previous[node] = -1
    end

    @distance[source] = 0

    unvisited_node = nodes.compact

    until unvisited_node.empty?
      u = nil

      unvisited_node.each do |min|
        u = min if !u || (@distance[min] && @distance[min] < @distance[u])
      end

      break if @distance[u] == INFINITY

      unvisited_node -= [u]

      graph[u].each_key do |vertex|
        alt = @distance[u] + graph[u][vertex]

        if alt < @distance[vertex]
          @distance[vertex] = alt
          @previous[vertex] = u
        end
      end
    end
  end

  def find_path(dest)
    find_path(@previous[dest]) if @previous[dest] != -1

    @path << dest
  end

  def shortest_paths(source, filter_nodes = nil)
    @graph_paths = []
    @source = source
    dijkstra(source)

    to_nodes = filter_nodes || nodes

    to_nodes.each do |dest|
      @path = []

      find_path(dest)

      next if @distance[dest] == INFINITY

      actual_distance = @distance[dest]

      @graph_paths << [dest, actual_distance]
    end

    @graph_paths
  end
end
