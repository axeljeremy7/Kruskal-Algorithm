

require_relative '../Graph/MyEdge'
require_relative '../Graph/MyVertex'

class MyGraph

  def initialize(label = nil)
    @label = label
    @mapp=Hash.new
    @listEdges = []
    @alpha = ['A','B','C', 'D', 'E', 'F', 'G' ,'H', 'I', 'J', 'K' ,'L', 'M' ,'N', 'O' ,'P' ,'Q' ,'R', 'S', 'T', 'U', 'V' ,'W' ,'X', 'Y', 'Z']
  end

  def randomVertex
    #return MyVertex.new("#{@alpha[rand(25)]}")
    return MyVertex.new("#{@alpha[rand(25)]}#{@alpha[rand(25)]}#{@alpha[rand(25)]}#{@alpha[rand(25)]}#{@alpha[rand(25)]}#{@alpha[rand(25)]}")
  end

  def getLabel
    @label
  end

  def setLabel(label)
    @label = label
  end

  def getMapp
    @mapp
  end

  def new_edge( v,  w, label=nil, value=nil)

    if !((v.is_a? MyVertex) && (w.is_a? MyVertex))
      return
    end

    edge = MyEdge.new(label, value)
    edge.addEndVertices(v,w)
    @listEdges.push(edge)
    v1 = MyVertex.new(v.getLabel, v.getValue)
    v2 = MyVertex.new(w.getLabel, w.getValue)
    v1.setId(v.getId)
    v2.setId(w.getId)
    v1.addEdge(edge)
    v2.addEdge(edge)

    if @mapp.key?(v.getId)
      if v == w
        @mapp[v.getId].push(v1)
        return
      end
      @mapp[v.getId].push(v2)
    else
      list = []
      list.push(v)
      list.push(v2)
      @mapp[v.getId]=list
    end


    if @mapp.key?(w.getId)
      @mapp[w.getId].push(v1)
    else
      list = []
      list.push(w)
      list.push(v1)
      @mapp[w.getId]= list
     end

  end

  def num_vertices
    @mapp.size
  end

  def num_edges
    @listEdges.size
  end

  def list_vertices
    listvertices = []
    @mapp.each do |key,value|
      listvertices.push(value.fetch(0))
    end
    listvertices
  end

  def list_edges
    @listEdges
  end

  def vertex(v)
    if !(v.is_a? MyVertex)
      return 0
    end

    if @mapp[v.getId].fetch(0).getId == v.getId
        return @mapp[v.getId].fetch(0)
    end
    return nil
  end

  def deg_vertex(v)
    if !(v.is_a? MyVertex)
      return 0
    end
    @mapp[v.getId].each do |value|
      if @mapp[v.getId].fetch(0).getId == value.getId
        return @mapp[v.getId].size - 1
      end
    end
  end

  def incident_edges(v)
    listIncidentEdges = []
    templist = @mapp[v.getId]
    for i in 1..templist.size-1
      listIncidentEdges.push(templist.fetch(i).getEdge)
    end
    listIncidentEdges

  end

  def adjacent_vertices(v)
    listAdjVerti = []
    if @mapp[v.getId] == nil
      return listAdjVerti
    end
    templist = @mapp[v.getId]
    for i in 1..templist.size-1
      listAdjVerti.push(templist.fetch(i))
    end
    listAdjVerti
  end

  def end_vertices(edge)
    edge.getEndVertices
  end

  def are_adjacent(v, w)
    if @mapp.key?(v.getId) && @mapp.key?(w.getId)
      temp = @mapp[v.getId]
      for i in 1..temp.size-1
        if temp.fetch(i).getId == w.getId
          return true
        end
      end
    end
    return false
  end

  def remove_edge(edge)
    @listEdges.delete(edge)
    templist = edge.getEndVertices
    for i in 1..@mapp[templist[0].getId].size-1
      if @mapp[templist[0].getId].fetch(i).getId == templist[1].getId
        @mapp[templist[0].getId].delete_at(i)
        break
      end
    end

    for i in 1..@mapp[templist[1].getId].size-1
      if @mapp[templist[1].getId].fetch(i).getId == templist[0].getId
        @mapp[templist[1].getId].delete_at(i)
      end
    end
  end

  def remove_vertex(vertex)
    templist = adjacent_vertices(vertex)
    templist.each do |v|
      for i in 1..@mapp[v.getId].size-1
        if @mapp[v.getId].fetch(i).getId == vertex.getId
           @mapp[v.getId].delete_at(i)
           break
        end
      end
    end
    @mapp.delete(vertex.getId)
  end



end
