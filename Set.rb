


class Set

  def initialize(element)
    @element = element
    @parent = self
    @size = 1
  end

  def getElement
    @element
  end

  def getParent
    @parent
  end

  def setParent(newParent)
    @parent = newParent
  end

  def getSize
    @size
  end

  def setSize(newsize)
    @size = newsize
  end


end
