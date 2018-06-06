require_relative 'graph'

# Implementing topological sort using Khan's algorithm

def topological_sort(graph)
  queue = []
  graph.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
  end
  sorted_result = []
  until queue.empty?
    curr_vertex = queue.shift
    curr_vertex.out_edges.reverse_each do |edge|
      edge.destroy!
    end
    sorted_result << curr_vertex
    graph.delete(curr_vertex)
    graph.each do |vertex|
      queue << vertex if vertex.in_edges.empty? && !queue.include?(vertex)
    end
  end
  graph.length.zero? ? sorted_result : []
end
