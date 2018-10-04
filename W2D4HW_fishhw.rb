# Sluggish Octopus

a1 = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
  max_fish = nil
  array.each_with_index do |fish, index1|
    (1...array.length).each do |j|
      next if index1 == j
      if fish.length > array[j].length
        max_fish = fish
      end
    end
  end
  max_fish
end


# Dominant Octopus
#MERGE SORT!!!!


class Array
  #this should look familiar
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = self.count / 2
    left_sort = self.take(midpoint).merge_sort(&prc)
    right_sort = self.drop(midpoint).merge_sort(&prc)

    Array.merge(left_sort, right_sort, &prc)
  end

  private
  def self.merge(left, right, &prc)
    answer = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        answer << left.shift
      when 0
        answer << right.shift
      when 1
        answer << right.shift
      end
    end

    answer.concat(left)
    answer.concat(right)

    answer
  end
end  #end of the Array class

#Clever Octopus

def biggest_fish(array)
  prc ||= Proc.new {|x,y| x.length <=> y.length}
  sorted = array.merge_sort(&prc)
  sorted.last
end


#Slow Dance

dance_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, dance_array)
  dance_array.each_with_index do |spot, index|
    return index if spot == direction
  end 
end
