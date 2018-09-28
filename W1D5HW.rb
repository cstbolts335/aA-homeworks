#App Academy W1D5HW

#Excercise 1 -- adding new methods to Stack

class Stack
  def initialize
  @answer_array = []
  end

  def push(el)
    answer_array.push(el)
  end

  def pop
    answer_array.pop
  end

  def peek
    answer_array.last
  end

private

attr_reader :answer_array

end #end of Stack class

# EXERCISE 2 - adding new methods to Queue
class Queue
  def initialize
    @answer_array = []
  end

  def enqueue(el)
    answer_array.unshift(el)
  end

  def dequeue
    answer_array.pop
  end

  def peek
    answer_array.first
  end

  private

  attr_reader :answer_array

end #end of Queue class


class Map
  def initialize
    @answer_array = []
  end

  def set(key, value)
    pair_index = answer_array.index { |pair| pair[0] == key }
      if pair_index
          answer_array[pair_index][1] = value
      else
          answer_array.push([key, value])
      end
    value
  end

  def get(key)
    answer_array.each {}
  end

  def get(key)
    answer_array.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    answer_array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(answer_array)
  end

  private
  attr_reader :answer_array

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end # end of my map Class
