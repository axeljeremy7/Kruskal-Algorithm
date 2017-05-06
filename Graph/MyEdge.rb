

require_relative '../Graph/MyVertex'

class MyEdge

  def initialize(label=nil, value=nil)
    @label = label
    @value = value
    @id = self.hash
    @endVerticesList = []
  end

  def getId
    @id
  end

  def getLabel
    @label
  end

  def setLabel(label)
    @label = label
  end

  def getValue
    @value
  end

  def setValue(value)
    @value = value
  end

  def addEndVertices( v1,  v2)
    if (v1.is_a? MyVertex) && (v2.is_a? MyVertex)
      @endVerticesList.push(v1)
      @endVerticesList.push(v2)
    end

  end

  def getEndVertices
    @endVerticesList
  end

  def to_s
    "Edge: #{@label}=> #{@value} ; #{@endVerticesList[0]}, #{@endVerticesList[1]}"
  end

end
