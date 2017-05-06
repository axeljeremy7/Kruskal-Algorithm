
require_relative '../Kruskal-Algorithm/Set.rb'

class Cluster

  def initialize(name=nil)
    @name = name
  end

  def makeSet(vertex)
    s = Set.new(vertex)
    return s
  end

  def findParent(x)
    #puts "Parent: #{x.getParent.getElement}"
    #puts "element: #{x.getElement}"
    r=x
    while (r.getParent != r)
      r = r.getParent
      #puts "after Parent: #{r.getParent.getElement}"
      #puts "after element: #{r.getElement}"
    end
    #puts "X parent element: #{r.getParent.getElement}"
    x.setParent(r)
    return x.getParent
  end

  def find(x)
    r=x
    puts "finf Parent: #{x.getParent.getElement}"
    puts "finf element: #{x.getElement}"
    while (r.getParent !=r)
      r = r.getParent
    end
    puts "R parent element: #{r.getParent.getElement}"
    return r.getParent
  end

  def union(x,y)

    a = findParent(x)
    b = findParent(y)

    if (a != b)
      if (a.getSize >= b.getSize)
        if (a.getSize == b.getSize)
          a.setSize(a.getSize + 1)
        end
        b.setParent(a.getParent)
        # puts "(a.getSize >= b.getSize)"
        # puts "a size: #{a.getSize}"
        # puts "a element #{a.getElement}"
        # puts "b parent #{b.getParent.getElement}"
        # puts "b element #{b.getElement}"
      else
        a.setParent(b.getParent)
        # puts " Else"
        # puts "a element #{a.getElement}"
        # puts "a parent #{a.getParent.getElement}"
        # puts "b element #{b.getElement}"
        # puts "a size: #{a.getSize}"
      end
    end

  end

end
