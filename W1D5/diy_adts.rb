class Stack
  attr_accessor :ivar

  def initialize
    # create ivar to store stack here!
    @ivar = []
  end

  def push(el)
    # adds an element to the stack
    @ivar << el
  end

  def pop
    # removes one element from the stack
    @ivar.slice!(-1)
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @ivar[-1]
  end
end

class Queue
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar << el
  end

  def dequeue
    @ivar.shift
  end

  def peek
    @ivar[0]
  end
end

class Map
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def set(key, value)
    if @ivar.any? { |x| x.include?(key) }
      @ivar.each_with_index do |x, i|
        @ivar[i][1] = value if x[0] == key
      end
    else
      @ivar << [key, value]
    end
  end

  def get(key)
    @ivar.each do |x|
      value = x[1]
      return value if x[0] == key
    end
  end

  def delete(key)
    @ivar.delete_if { |x| x[0] == key }
  end

  def show
    deep_dup(@ivar)
  end

  private

  def deep_dup(array)
    return [array.first] if array.length == 1
    [array.first] << deep_dup(array[1..-1])
  end
end
