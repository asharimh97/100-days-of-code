class Node
  attr_accessor :value, :next

  def initialize (data)
    @value = data
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
    if head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
    @size += 1
  end

  def prepend (node)
    node.next = @head
    @head = node
    @size += 1
  end

  def at (index)
    if index < size
      idx = 0
      node = @head
      index.times do |x|
        node = node.next
      end

      node
    else
      "Exceed boundary"
    end
  end

  def pop
    temp = @head
    if temp.next.nil?
      @head = nil
      @tail = nil
      return 
    end

    until temp.next == @tail do
      temp = temp.next
    end

    temp.next = nil
    @tail = temp
    @size -= 1
  end

  def shift
    @head = @head.next
    @tail = @head if @head.nil?
    @size -= 1 if @size >= 0 
  end

  # TODO: Add insertion with specified index
  def insert_at (value, index)
  end

  # TODO: Add remover with specified index
  def remove_at
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

  def contains? (value)
    head = @head
    contain = false
    until head.nil? do
      if head.value == value 
        contain = true
        break
      end

      head = head.next
    end

    contain
  end

  def find (value)
    step = 0
    idx = nil
    head = @head

    until head.nil? do
      if head.value == value
        idx = step
        break
      end

      head = head.next
      step += 1
    end

    idx
  end
end

one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)

list = LinkedList.new
list.append(one)
list.append(two)
list.prepend(three)
list.prepend(four)

p list.find(99)
puts list.contains?(99)