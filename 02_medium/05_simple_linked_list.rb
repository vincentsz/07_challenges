class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, nxt = nil)
    @datum = datum
    @next = nxt
  end

  def tail?
    !@next
  end
end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(coll)
    self.new(coll)
  end

  def to_a
    @coll
  end

  def initialize(coll = [])
    @counter = 0
    @head = nil
    @coll = coll
    unless @coll.nil?
      loop do 
        break if @counter >= @coll.size
        push(@coll[-(@counter + 1)])
      end
    end
  end

  def reverse
    SimpleLinkedList.new(to_a.reverse)
  end

  def size
    @counter
  end

  def empty?
    @counter == 0
  end

  def push(datum)
    element = Element.new(datum)
    element.next = @head if @head
    @head = element
    @counter += 1
  end

  def peek
    @head ? @head.datum : nil
  end

  def pop
    deleted_datum = @head.datum
    @head = @head.next
    @counter -= 1
    deleted_datum
  end
end
