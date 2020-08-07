class Node
  include Comparable
  attr_accessor :data, :left, :right

  def <=> (leaf)
    @data <=> leaf.data
  end

  def initialize (data)
    @data = data
    @left = nil
    @right = nil
  end

  # def inspect
  #   @data
  # end
end

class Tree
  attr_reader :root

  def initialize (arr)
    @root = build_tree(arr.sort)
  end

  def build_tree (sorted_arr)
    return nil if sorted_arr.length == 0

    mid = sorted_arr.length / 2
    
    return Node.new(sorted_arr[mid]) if sorted_arr.length == 1
    
    root = Node.new(sorted_arr[mid])
    root.left = build_tree(sorted_arr[0..mid-1])
    root.right = build_tree(sorted_arr[mid+1..-1])

    return root
  end

  def find (node, root = @root)
    node = Node.new(node) unless node.kind_of? (Node)
    return root if root.nil? || root == node

    if node < root
      find(node, root.left)
    elsif node > root
      find(node, root.right)
    end
  end

  def insert (node, root = @root)
    node = Node.new(node) unless node.kind_of? (Node) 
    if (root.nil?)
      root = node
    else
      if (node < root)
        if root.left.nil?
          root.left = node
        else
          insert(node, root.left)
        end
      else
        if root.right.nil?
          root.right = node
        else
          insert(node, root.right)
        end
      end
    end

    def delete (node, root = @root)
      node = Node.new(node) unless node.kind_of? (Node)

      return root if root.nil?

      # if value smaller/bigger than root, the value is in subtree
      if node < root
        root.left = delete(node, root.left)
      elsif node > root
        root.right = delete(node, root.right)
      else
        # the value is root, delete root
        if root.left.nil? 
          temp = root.right
          root = nil
          return temp
        elsif root.right.nil?
          temp = root.left
          root = nil
          return temp
        end

        # get the minimum value in the right branches of tree
        temp = min_value_node(root.right)

        root.data = temp.data

        root.right = delete(temp, root.right)
      end

      root
    end

    def min_value_node(node)
      current = node

      until current.left.nil? do
        current = current.left
      end

      current
    end
  end

  def pretty_print(node = root, prefix="", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
    pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
  end

  # printing tree
  def level_order (root = @root)
    return root if root.nil?
    arr = Array.new
    q = Array.new

    q.push(root)
    until q.empty? do
      current = q[0]
      arr.push(current.data)

      q.push(current.left) unless current.left.nil?
      q.push(current.right) unless current.right.nil?

      q.shift
    end

    arr
  end

  def pre_order (root = @root, arr = [])
    unless root.nil?
      arr.push(root.data)
      pre_order(root.left, arr)
      pre_order(root.right, arr)
    end

    arr
  end

  def in_order (root = @root, arr = [])
    unless root.nil?
      in_order(root.left, arr)
      arr.push(root.data)
      in_order(root.right, arr)
    end

    arr
  end

  def post_order (root = @root, arr = [])
    unless root.nil?
      post_order(root.left, arr)
      post_order(root.right, arr)
      arr.push(root.data)
    end

    arr
  end
  
end

arr = [1, 2, 4, 10, 3, 7]

tree = Tree.new (arr)

# p tree.root
tree.insert(11)
tree.insert(0)
tree.insert(4)
# tree.pretty_print

tree.delete(0)
tree.delete(4)
tree.insert(-1)
tree.insert(1)
tree.insert(2)

tree.pretty_print
p tree.find(-1)

p tree.level_order

p tree.pre_order
p tree.in_order
p tree.post_order