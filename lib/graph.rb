class Vertex

  attr_reader :value
  attr_accessor :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def add_edge_to_to_vertex(edge)
    in_edges << edge
  end

  def add_edge_to_from_vertex(edge)
    out_edges << edge
  end

end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    addEdgesToVertices(from_vertex, to_vertex)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
  end

  def destroy!

  end

  private
  def addEdgesToVertices(from_vertex, to_vertex)
    from_vertex.add_edge_to_from_vertex(self)
    to_vertex.add_edge_to_to_vertex(self)
  end
end
