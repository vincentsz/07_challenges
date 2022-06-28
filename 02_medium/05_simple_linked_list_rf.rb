class Element
  attr_reader :datum, :next
  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(coll)
    list = self.new
    unless coll.nil?
      coll.reverse_each do |data|
        list.push(data)
      end
    end
  list
  end

  def reverse
    list = SimpleLinkedList.new
    current_element = @head
    while current_element
      list.push(current_element.datum)
      current_element = current_element.next
      @head = current_element
    end
    list
  end

  def to_a
    current_element = @head
    collection = []
    while current_element
      collection << current_element.datum
      current_element = current_element.next
    end
    collection
  end

  def size
    counter = 0
    current_element = @head
    while current_element
      counter += 1
      current_element = current_element.next
    end
    counter
  end

  def push(data)
    current_element = Element.new(data, @head)
    @head = current_element
  end

  def empty?
    !@head
  end

  def peek
    @head.datum if @head
  end

  def pop
    current_element = @head
    @head = current_element.next
    current_element.datum
  end
end
