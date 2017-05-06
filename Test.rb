
=begin

Author(s): Axel Solano
=end

require_relative '../Kruskal-Algorithm/Graph/MyEdge.rb'
require_relative '../Kruskal-Algorithm/Graph/MyVertex.rb'
require_relative '../Kruskal-Algorithm/Graph/MyGraph.rb'
require_relative '../Kruskal-Algorithm/MinHeap.rb'
require_relative '../Kruskal-Algorithm/Kruskal.rb'
require 'Benchmark'

g = MyGraph.new
a = MyVertex.new("A")
d = MyVertex.new("D")
b = MyVertex.new("B")
c = MyVertex.new("C")
f = MyVertex.new("F")
e = MyVertex.new("E")
g1 = MyVertex.new("G")
g.new_edge(a,d,"Line 3", 3)
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
g.new_edge(b,b,"Line LOOP 19",19)

puts "\n List of edges"

puts "\n"
lista = g.list_edges
sizeLista = lista.length
puts "Size of the list of edges => #{sizeLista} \n"
lista.each do |v|
  puts "#{v}"
  puts "  Key => #{v.getValue}"
  puts "#{v.getEndVertices.fetch(0)} and id: #{v.getEndVertices.fetch(0).getId}"
  puts "#{v.getEndVertices.fetch(1)} and id: #{v.getEndVertices.fetch(1).getId}\n\n"
end
puts "\n Before  ignore b nw"
puts g.list_edges


puts "\n\n After - HEAP"
h = MinHeap.new
h.buildHeap(lista)
puts lista

puts "\n Removing"
n = h.getSize
(1..n).each do |var|
  puts "index #{var} : #{h.removeMin(lista)}"
end




puts "\n KRUSKAL BEGIN HERE: "
k = Kruskal.new
tree = k.mstKruskal(g)
puts tree
puts "\n\nENDing\n\n"



#FOR TESTING:
#Creating a random graph
=begin
graph = MyGraph.new
array  = Array.new

n = 5
array  = Array.new
(1..n).each do
  array.push(graph.randomVertex)
end
puts array
puts "\n"
n = n-1
(0..n).each do |i|
  (i+1..n).each do |j|
    #if rand()>=0.5
      t = rand(50)+1
      graph.new_edge(array[i],array[j],"Line #{t}",t)
    #end
  end
end

puts "\n\n   list of edges"
puts graph.list_edges
=end


#Testing graphs
=begin
file = File.open('kruskal.csv', 'w')
#but i couldnt get to 100 because it takes time to create the loop
(70..100).each do |size|
  graph = MyGraph.new
  array.clear

  n = size*100 #n is the number of vertexes.
  n.times do
    array.push(graph.randomVertex)
  end

  n1 = n-1
  (0..n1).each do |i|
    (i+1..n1).each do |j| #i+1 to avoid loops
      #if rand()>=0.5
        t = rand(n*n)
# > 25^7
# [1] 6103515625
# > 25^6
# [1] 244140625
# > 25^5
# [1] 9765625
#because 100*100(10000-1)/2
        graph.new_edge(array[i],array[j],"Line #{t}",t)
      #end
    end
  end

  m = graph.list_edges.size #m is the number of edges.

  time = Benchmark.measure do
    kruskal = Kruskal.new
    kruskal.mstKruskal(graph)
  end

  puts "  #{m}, #{n}, #{time.real}\n"
  file.write("#{m},#{n},#{time.real}\n")
end
puts "\nDONE\n\n"
file.close

=end

#Testing Hash
=begin
puts "\n\n"
file = File.open('hashTest.csv', 'w')

s = Hash.new
(1..100).each do |size|
  s.clear
  i = rand(1000)
  puts "      random number: #{i}"
  (size*10000).times do
    i = i + 3
    s[i] = rand(10000000)
  end

  n = i*0.5
  #puts "      id to find #{n}"
  time = Benchmark.measure do |i|

    10.times do
      s.has_key?(n)
    end

  end
  puts "  #{size*10000},    #{time.real/10}\n"
  file.write("#{size*10000},#{time.real/10}\n")

end
puts "\nDONE\n\n"
file.close
=end
