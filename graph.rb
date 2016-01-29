class Vertex
  def initialize(val)
    @val = val
    in_edges = []
    out_edges = []
  end
end

class Edge
  def initialize(from, to, weight)
    @from = from
    @to = to
    @weight = weight
    @from.out_edges << self
    @to.in_edges << self
  end
end
