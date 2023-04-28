# frozen_string_literal: true

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(val)
    new_node = Node.new(val)
    curr_node = head
    if curr_node
      curr_node = curr_node.next_node while curr_node.next_node
      curr_node.next_node = new_node
    else
      @head = new_node
    end
  end

  def my_prepend(val)
    new_node = Node.new(val)
    new_node.next_node = head if head
    @head = new_node
  end

  def size
    return 0 unless head

    size = 1
    curr_node = head
    while curr_node.next_node
      size += 1
      curr_node = curr_node.next_node
    end
    size
  end

  def tail
    return nil unless head

    curr_node = head
    curr_node = curr_node.next_node while curr_node.next_node
    curr_node
  end

  def to_s
    res = ''
    if head
      curr_node = head
      while curr_node
        res << "(#{curr_node.value})->"
        curr_node = curr_node.next_node
      end
    end
    res << 'nil'
  end

  def at(index)
    if head
      tmp_index = 0
      curr_node = head
      while curr_node
        return curr_node if tmp_index == index

        curr_node = curr_node.next_node
        tmp_index += 1
      end
    end
    nil
  end

  def pop
    if !head
      nil
    else
      curr_node = head
      curr_node = curr_node.next_node while curr_node.next_node.next_node
      curr_node.next_node = curr_node.next_node.next_node
      head
    end
  end
end

test = LinkedList.new
test.append('test1')
test.append('test2')
test.append('test3')
test.my_prepend('test4')
test.pop
test.pop

p test.at(4)
p test.to_s
