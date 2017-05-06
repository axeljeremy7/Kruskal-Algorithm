require_relative '../Kruskal-Algorithm/Graph/MyEdge.rb'
require_relative '../Kruskal-Algorithm/Graph/MyVertex.rb'
require_relative '../Kruskal-Algorithm/Graph/MyGraph.rb'
require_relative '../Kruskal-Algorithm/MinHeap.rb'
require_relative '../Kruskal-Algorithm/Cluster.rb'
require_relative '../Kruskal-Algorithm/Set.rb'
=begin
Author(s): Axel Solano
=end


class Kruskal

  def initialize()
    @h = MinHeap.new
  end

  def mstKruskal(graph)
    tree = []
    mapp = Hash.new
    cluster = Cluster.new
    lista = graph.list_edges
    @h.buildHeap(lista)
    #puts "\n Heap Lista"
    #puts lista
    #puts "\n"
    listvertices = graph.list_vertices
    #puts "\n"
    listvertices.each do |v|
      #puts "#{v}"
      mapp[v.getId] = cluster.makeSet(v)
      #puts mapp[v.getId]

    end

    #puts "\n\nTREE:"
    i = 1
    n = @h.getSize
    while ( tree.length!=lista.length-1 &&  i<=n )
      i = i + 1
      edge = @h.removeMin(lista)
      v1 = edge.getEndVertices.fetch(0)
      v2 = edge.getEndVertices.fetch(1)
      #puts "\n\nV1: #{v1}"
      #puts "V2: #{v2}"
      #puts "\n\nFIRST OF FINDING\n"
      a = cluster.findParent(mapp[v1.getId])
      b = cluster.findParent(mapp[v2.getId])
      #puts "END OF FIRST OF FINDING\n\n"
      if a != b
        tree.push(edge)
        #puts "BEGIN UNION"
        cluster.union(a,b)
        #puts "END OF  UNION"
      end

    end

    return tree
  end



end
