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

  def insert (root = @root, node)
    node = Node.new(node) unless node.kind_of? (Node) 
    if (root.nil?)
      p "Rootnya ini gan"
      root = node
    else
      if (node < root)
        if root.left.nil?
          root.left = node
        else
          insert(root.left, node)
        end
      else
        if root.right.nil?
          root.right = node
        else
          insert(root.right, node)
        end
      end
    end
  end

  def pretty_print(node = root, prefix="", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
    pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
  end
end

arr = [1, 2, 4, 10, 3, 7]

tree = Tree.new (arr)

# p tree.root
tree.insert(11)
tree.insert(0)
tree.insert(4)
tree.pretty_print
