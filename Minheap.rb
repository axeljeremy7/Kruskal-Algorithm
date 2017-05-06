require_relative '../Kruskal-Algorithm/Graph/MyVertex.rb'
require_relative '../Kruskal-Algorithm/Graph/MyEdge.rb'
=begin

Author(s): Axel Solano
=end

#This minHeap has been edited for the specifacions of the list of edges
class MinHeap

  def initialize
    @size = 0
    @op = 0
    @opsr = 0
    @counEli = 0
  end

  def minheapify(a,i)
    largest = 0
    ops = 0
    while (i >=0 ) do
      l = 2*i + 1
      r = 2*i + 2
      ops = ops + 1

      if l <= @size && a[l].getValue < a[i].getValue
        largest = l
      else
        largest = i
      end

      if r <= @size && a[r].getValue < a[largest].getValue
        largest = r
      end

      if largest != i
        temp = a[i]
        a[i] = a[largest]
        a[largest] = temp
        i = largest

        if(2*i+1>@size || 2*i+2>@size)
          break;
        end

      else
        break;
      end

    end
    @op = ops
    #puts minheapify operations => #{ops} "
  end

  def getoperationsofmaxheapify
    @op
  end

  def getSize
    @size+1
  end

  def buildHeap(a)

    #puts "Build heap function:"
    @size = a.length-1
    i = (@size-1)/2
    c = 0
    while (i >=0)
      #puts "index => #{i}"
      #puts "a[]=> #{a[i].getvalue}"
      minheapify(a,i)
      #puts "NEW a[]=> #{a[i].getvalue}"
      c = c + @op
      #puts "c => #{@op}"
      i = i - 1
      #puts "\n"
    end

    #puts "Total of Build operations:----------------=> #{c}"
    #puts "end of Build heap\n\n"
  end


  def removeMin(a)
    temp = a[0]
    #puts "sz: #{@size}"
    a[0] = a[@size]
    @size = @size - 1
    i = 0
    c = 0
    j = 0
    while i < @size do
      c = c + 1
      l = 2*i + 1
      r = 2*i + 2

      if (r <= @size)
        if ( a[i].getValue <= a[l].getValue && a[i].getValue <= a[r].getValue )
          @opsr = c
          return temp
        else
          if (a[l].getValue < a[r].getValue)
            j = l
          else
            j = r
          end
          t = a[i]
          a[i] = a[j]
          a[j] = t

          i = j
          if (l > @size)
            break;
          end

        end
      else
        if (l <= @size)
          if (a[i].getValue > a[l].getValue)
            t = a[i]
            a[i] = a[l]
            a[l] = t
          end
        end
        #
        @opsr = c
        return temp
        #
      end
      #
    end
    #
    @opsr = c
    return temp
  end

  def getopsr
    @opsr
  end


end
