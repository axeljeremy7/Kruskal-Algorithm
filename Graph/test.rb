require_relative '../Graph/MyEdge.rb'
require_relative '../Graph/MyVertex.rb'
require_relative '../Graph/MyGraph.rb'

v = MyVertex.new("Vertex A",72)
puts v
e = MyEdge.new("Line Three", 3)
v.addEdge(e)
puts v.getEdge
w = MyVertex.new("Vertex D",35)
e.addEndVertices(v,w)
puts  e.getEndVertices

id = v.getId
list = []
list.push(11)
list.push(10)
puts "list: 1"
puts list
mapp = {v.getId => list}
puts "list: 11"
puts list
mapp[id].push(list)
puts "\n mapp[id].fetch(2).fetch(1) \n"
puts mapp[id].fetch(2).fetch(1)
puts "\n dos \n"

if(mapp.has_key?(id))
  puts "T"
end


g = MyGraph.new
a = MyVertex.new("A")
d = MyVertex.new("D")
g.new_edge(a,d,"Line 3", 3)
puts g.getMapp[v.getId]
puts "\n\n"
puts g.getMapp[w.getId]
b = MyVertex.new("B")
c = MyVertex.new("C")
f = MyVertex.new("F")
e = MyVertex.new("E")
g1 = MyVertex.new("G")
g.new_edge(a,b, "Line 2", 2)
g.new_edge(b,c,"Line 4", 4)
g.new_edge(e,e, "Line LOOP 8", 8)
g.new_edge(f,e,"Line 8", 8)
g.new_edge(f,g1,"Line 9", 9)
g.new_edge(b,e,"Line 3", 3)
g.new_edge(c,e,"Line 1", 1)
g.new_edge(d,f,"Line 7", 7)
g.new_edge(c,d,"Line 5", 5)
g.new_edge(a,c,"Line 3", 3)


puts "\n List of edges  THIS PART I WILL USE"
puts g.list_edges
puts "\n"
lista = g.list_edges
sizeLista = lista.length
puts "Size of the list=> #{sizeLista} \n"
lista.each do |v|
  puts "#{v}"
  puts "key=> #{v.getValue}"
  puts "#{v.getEndVertices.fetch(0)}"
  puts "#{v.getEndVertices.fetch(1)}\n\n"
end


puts "\nEND\n\n\n"
=begin
puts "\n\n g.getMapp[v.getId]"
puts g.getMapp[v.getId]

puts "\nnum_vertices"
puts g.num_vertices

puts "\nnum_edges"
puts g.num_edges

puts "\n List of vertices"
puts g.list_vertices

puts "\n Degree of Vertex V"
puts g.deg_vertex(v)

puts "\n incident_edges of V"
puts g.incident_edges(v)

puts "\n adjacent_vertices of Vertex V"
puts g.adjacent_vertices(v)

puts "\n end_vertices of edge"
puts g.list_edges.fetch(0)
puts g.end_vertices(g.list_edges.fetch(0))

puts "\n are_adjacent"
puts g.are_adjacent(v,w)

puts "\n adjacent_vertices of V"
puts g.adjacent_vertices(v)

puts "\n adjacent_vertices of W"
puts g.adjacent_vertices(w)

puts "\n adjacent_vertices of V2"
puts g.adjacent_vertices(v2)

puts "after deletion of V"
g.remove_vertex(v)

puts "\n adjacent_vertices of V"
puts g.adjacent_vertices(v)

puts "\n adjacent_vertices of W"
puts g.adjacent_vertices(w)

puts "\n adjacent_vertices of V2"
puts g.adjacent_vertices(v2)

puts "\n v2  connected to b"
puts g.list_edges[6]
puts g.end_vertices(g.list_edges[6])
puts "\n adjacent_vertices of v2"
puts g.adjacent_vertices(v2)
puts "\n adjacent_vertices of b"
puts g.adjacent_vertices(b)

puts "\n ...........DELETING..."
g.remove_edge(g.list_edges[6])

puts "\n AFTER adjacent_vertices of v2"
puts g.adjacent_vertices(v2)
puts "\n AFTER adjacent_vertices of b"
puts g.adjacent_vertices(b)

edp = MyEdge.new(nil,7)
puts edp
edp2 = MyEdge.new("oli")
puts edp2

puts edp.getLabel == nil
edp3 = MyEdge.new
puts edp3.getLabel == nil
puts edp2.getValue == nil
puts "oliiii"
edp3.setValue(edp)
puts edp3.getValue == edp


=end
