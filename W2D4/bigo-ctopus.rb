def sluggish_octopus(array)
  max_fish_length = 0
  best_fish = nil
  array.combination(2).each do |x|
    if x[0].length > x[1].length && max_fish_length < x[0].length
      max_fish_length = x[0].length
      best_fish = x[0]
    elsif x[1] > x[0] && max_fish_length < x[1]
      max_fish_length = x[1].length
      best_fish = x[1]
    end
  end
  best_fish
end

def dominant_octopus(array)
  return array.first if array.length == 1
  return [] if array.empty?
  mid = array.length / 2
  left = dominant_octopus(array[0...mid])
  right = dominant_octopus(array[mid..-1])
  merge(arr1, arr2)
end

def merge(arr1, arr2)
  array = []
  until arr1.empty? || arr2.empty?
    arr1.first > arr2.first ? array << arr2.shift : array << arr1.shift
  end
  array + arr1 + arr2
end

def clever_octopus(array)
  max_fish_length = 0
  best_fish = nil
  array.each do |x|
    if x.length > max_fish_length
      max_fish_length = x.length
      best_fish = x
    end
  end
  best_fish
end

sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
clever_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def slow_dance(direction, array)
  array.each_with_index { |x, i| return i if x == direction }
end

def fast_dance(direction, array)
  array.index(direction)
end

slow_dance("right-down", ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ])
fast_dance("right-down", ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ])
