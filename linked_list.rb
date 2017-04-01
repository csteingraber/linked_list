# This class is for containing the value and
# pointer of each element in the linked list.
class Node

  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# This class represents the full
# linked list data structure.
class LinkedList

  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend(node)
    if @head == nil
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
    @size += 1
  end

  def at(index)
    if index >= @size || index < 0
      puts "Out of bounds!"
    else
      pointer = @head
      index.times { pointer = pointer.next_node }
      pointer
    end
  end

  def pop
    if @size >= 2
      second_to_last = @size - 2
      node = at(second_to_last)
      node.next_node = nil
      popped_node = @tail
      @tail = node
      @size -= 1
      popped_node
    elsif @size == 1
      popped_node = @head
      @head = nil
      @tail = nil
      @size -= 1
      popped_node
    else
      puts "Nothing to pop!"
    end
  end

  def contains?(value)
    answer = false
    pointer = @head
    @size.times do
      if pointer.value == value
        answer = true
        break
      end
      pointer = pointer.next_node
    end
    answer
  end

  def find(data)
    index = nil
    pointer = @head
    @size.times do |iteration|
      if pointer.value == data
        index = iteration
        break
      end
      pointer = pointer.next_node
    end
    index
  end

  def to_s
    pointer = @head
    @size.times do
      print "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    print "nil"
  end

  def insert_at(index, node)
    if index == 0
      prepend(node)
    elsif index == @size
      append(node)
    elsif index.between?(0, @size-1)
      node_before = at(index - 1)
      node.next_node = node_before.next_node
      node_before.next_node = node
      @size += 1
    else 
      puts "Out of bounds!" 
    end
  end

  def remove_at(index)
    if @size > 0
      if index == 0
        @head = @head.next_node
        @size -= 1
        @tail = nil if @size == 0 
      elsif index == @size - 1
        second_to_last = @size - 2
        node = at(second_to_last)
        node.next_node = nil
        @tail = node
        @size -= 1
      elsif index.between?(0, @size-1)
        node_before = at(index - 1)
        node_before.next_node = node_before.next_node.next_node
        @size -= 1
      else
        puts "Out of bounds!"
      end
    else 
      puts "Nothing to remove!"
    end
  end
end