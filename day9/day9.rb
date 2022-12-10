VISITED = { }

def head_movements
  file = File.readlines('input.txt', chomp: true)
  input = file.map {_1.split(" ") }
  singular = input.each do |direction|
    direction[1] = direction[1].to_i
  end
  singular.map do |multiple|
    Array.new(multiple[1]) { |i| multiple[0] }
  end.flatten
end

# length = head_movements.length
# half = length / 2
# first_half = head_movements[0..half]
# second_half = head_movements[(half+1)..-1]

def tail_touches_head?(head_position, tail_position)
  (head_position[0] - tail_position[0]).abs <= 1 && (head_position[1] - tail_position[1]).abs <= 1
end

def move_tail(head_position, tail_position)
  if head_position[0] == tail_position[0]
    if head_position[1] > tail_position[1]
      tail_position[1] += 1
    else
      tail_position[1] -= 1
    end
  end

  if head_position[1] == tail_position[1]
    if head_position[0] > tail_position[0]
      tail_position[0] += 1
    else
      tail_position[0] -= 1
    end
  end

  if (head_position[0] - tail_position[0]).abs == 2
    if head_position[1] > tail_position[1]
      tail_position[1] += 1
      if head_position[0] > tail_position[0]
        tail_position[0] += 1
      else
        tail_position[0] -= 1
      end
    else
      tail_position[1] -= 1
      if head_position[0] > tail_position[0]
        tail_position[0] += 1
      else
        tail_position[0] -= 1
      end
    end
  end

  if (head_position[1] - tail_position[1]).abs == 2
    if head_position[0] > tail_position[0]
      tail_position[0] += 1
      if head_position[1] > tail_position[1]
        tail_position[1] += 1
      else
        tail_position[1] -= 1
      end
    else
      tail_position[0] -= 1
      if head_position[1] > tail_position[1]
        tail_position[1] += 1
      else
        tail_position[1] -= 1
      end
    end
  end
  return tail_position
end

# def tail_movement(head_movements, head_position, tail_position, n)
#   # p "head at #{head_position}"
#   # p "tail at #{tail_position}"
#   # p head_movements[n]
#   p n
#   if n == head_movements.length
#     return "recursion done"
# end

def lets_move(head_movements, head_position, tail_position)
  head_movements.each do |head_movement|
    case head_movement
    when "L"
      head_position[0] -= 1
    when "R"
      head_position[0] += 1
    when "D"
      head_position[1] -= 1
    when "U"
      head_position[1] += 1
    end

    if tail_touches_head?(head_position, tail_position)
      tail_position = tail_position
    else
      tail_position = move_tail(head_position, tail_position)
    end
    VISITED["#{tail_position}"] = 1
  end
end

# lets_move(head_movements, [0, 0], [0, 0])

# p VISITED.count

KNOTS = {
  first: [0, 0],
  second: [0, 0],
  third: [0, 0],
  fourth: [0, 0],
  fifth: [0, 0],
  sixth: [0, 0],
  seventh: [0, 0],
  eighth: [0, 0],
  ninth: [0, 0]
}

head_position = [0, 0]

head_movements.each do |head_movement|
  case head_movement
  when "L"
    head_position[0] -= 1
  when "R"
    head_position[0] += 1
  when "D"
    head_position[1] -= 1
  when "U"
    head_position[1] += 1
  end

  lead_knot_position = head_position

  KNOTS.each do |knot_num, knot_position|
    if tail_touches_head?(lead_knot_position, knot_position)
      KNOTS[knot_num] = knot_position
    else
      KNOTS[knot_num] = move_tail(lead_knot_position, knot_position)
    end
    lead_knot_position = knot_position
  end
  VISITED["#{KNOTS[:ninth]}"] = 1
end

p VISITED.count
