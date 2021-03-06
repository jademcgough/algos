# A heap is a tree data structure that satisfies the *heap property* - each node follows a pattern.
#
# the max-heap property - A[PARENT(i)] >= A[i] - the parent of any node is a greater value than its children.
# the min-heap property - A[PARENT(i)] <= A[i] - the parent of any node is a lesser value than its children.
#
# CLRS describes the following methods:
# max_heapify: O(lgn), maintains the max-heap property
# build_max_heap: O(n), builds a max-heap from an unordered input array
# heapsort: O(nlgn), sorts an array in place.
# max_heap_insert, heap_extract_max, heap_increase_key, heap_maxiumum: O(lgn), allow the heap to implement a priority queue
#
# Heaps typically aren't used for sorting (they're outperformed by some other algorithms) but can make for nice priority queues.
# You can do a really optimal Dijkstra's implementation with a heap.


class MaxHeap
  attr_accessor :heap

  def initialize(ary)
    @heap = ary
    (ary.size / 2).downto(0) do |i|
      heapify(i)
    end
  end

  # utility methods for getting the index of left/right/parent nodes
  def left(index)
    (index * 2) + 1
  end

  def right(index)
    (index * 2) + 2
  end

  def parent(index)
    (index - 1) / 2
  end

  def <<(value)
    @heap << value
    parent = parent(@heap.size - 1)
    heapify(parent, :up)
  end

  def max
    @heap[0]
  end

  def extract_max
    @heap[0], @heap[@heap.size - 1] = @heap.last, @heap.first
    max = @heap.pop
    heapify(0) unless @heap.empty?
    return max
  end

  # O(lgn)
  def increase_key(index, value)
    raise '' if value < @heap[index]
    @heap[index] = value
    heapify(parent(index), :up)
  end

  private

  # O(lgn)
  def heapify(index, direction = :down)
    return if index < 0

    left = left(index)
    right = right(index)
    if !@heap[left].nil? && @heap[left] > @heap[index]
      largest = left
    else
      largest = index
    end
    if !@heap[right].nil? && @heap[right] > @heap[largest]
      largest = right
    end
    unless largest == index
      @heap[largest], @heap[index] = @heap[index], @heap[largest]
      if direction == :down
        heapify(largest)
      elsif direction == :up
        heapify(parent(index), :up)
      end
    end
  end

end
