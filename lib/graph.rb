class Vertex

  attr_reader :value
  attr_accessor :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    add_edge_to_vertices
  end

  def destroy!
    delete_edges_from_vertices
    @from_vertex = nil
    @to_vertex = nil
  end

  private
  def add_edge_to_vertices
    from_vertex.out_edges << self
    to_vertex.in_edges << self
  end

  def delete_edges_from_vertices
    from_vertex.out_edges.delete(self)
    to_vertex.in_edges.delete(self)
  end
end
