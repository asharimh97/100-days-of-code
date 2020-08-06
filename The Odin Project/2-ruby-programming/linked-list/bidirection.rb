class Node
  attr_accessor :value, :prev, :next
  def initialize (value)
    @value = value
    @prev = nil
    @next = nil
  end
end

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize 
    @head = nil
    @tail = nil
    @size = 0
  end

  def append (node)
    if @head.nil?
      @head = node
      @tail = node
    else
      p @tail
      @tail.next = node
      node.prev = @tail
      @tail = node
    end

    @size += 1
  end

  def prepend (node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head.prev = node
      @head = node
    end
  end

  def unshift (node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head.prev = node
      @head = node
    end
  end

  def shift
    if head.nil?
      @tail = @head
    else
      @head = @head.next
      @head.prev = nil unless @head.nil?
      @size -= 1
    end
  end

  def pop
    if @tail.nil?
      @head = @tail
    else
      @tail = @tail.prev
      @tail.next = nil unless @tail.nil?
      @size -= 1
    end
  end

  def to_s
    head = @head
    until (head.nil?) do
      print "#{head.value} -> "
      print "nil" if head.next.nil?

      head = head.next
    end
    puts
  end
end

one = Node.new(1)
two = Node.new(2)
three = Node.new(3)

list = LinkedList.new

list.append(one)
list.append(two)

list.to_s

list.shift
list.shift

list.to_s