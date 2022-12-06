def stragey_guide
  file = File.read('input.txt')
  input = file.split("\n").map do |fight|
    fight.split(" ")
  end
  input
end

def lets_fight
  sum = 0
  stragey_guide.each do |battle|
    if battle[1] == "X"
      case battle[0]
      when "A"
        sum += 4
      when "B"
        sum += 1
      when "C"
        sum += 7
      end
    end

    if battle[1] == "Y"
      case battle[0]
      when "A"
        sum += 8
      when "B"
        sum += 5
      when "C"
        sum += 2
      end
    end

    if battle[1] == "Z"
      case battle[0]
      when "A"
        sum += 3
      when "B"
        sum += 9
      when "C"
        sum += 6
      end
    end
  end
  return sum
end

p lets_fight

def lets_fight_again
  sum = 0
  stragey_guide.each do |battle|
    if battle[1] == "X"
      case battle[0]
      when "A"
        sum += 3
      when "B"
        sum += 1
      when "C"
        sum += 2
      end
    end

    if battle[1] == "Y"
      case battle[0]
      when "A"
        sum += 4
      when "B"
        sum += 5
      when "C"
        sum += 6
      end
    end

    if battle[1] == "Z"
      case battle[0]
      when "A"
        sum += 8
      when "B"
        sum += 9
      when "C"
        sum += 7
      end
    end
  end
  return sum
end

p lets_fight_again
