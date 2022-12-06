def calories
  file = File.read('input.txt')
  # input = file.readlines.map(&:chomp)
  # file.close
  # input
  input = file.split("\n\n").map do |calorie|
    calorie.split("\n")
  end
end

def sum_calories
  numbers = calories.map do |group|
    group.map(&:to_i).sum
  end
  numbers
end

p sum_calories.sort.reverse.first(3).sum
