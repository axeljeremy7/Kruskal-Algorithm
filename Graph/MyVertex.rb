


class MyVertex

  def initialize(label=nil, value=nil)
    @label = label
    @value = value
    @id = self.hash
  end

  def getId
    @id
  end

  def setId(id)
    if(id.is_a? Numeric)
      @id = id
    end
  end

  def getLabel
    @label
  end

  def getValue
    @value
  end

  def setValue(value)
    @value = value
  end

  def setLabel(label)
    @label = label
  end

  def addEdge(edge)
    if edge.is_a? MyEdge
      @edge = edge
    end
  end

  def getEdge
    @edge
  end

  def to_s
    "Vertex: #{@label}=> #{@value}"
  end

end
