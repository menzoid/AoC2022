
lowercase_num = (1..26).to_a
lowercase = ("a".."z")
uppercase = ("A".."Z")
uppercase_num = (27..52).to_a

PRIORITY = { }

lowercase.each_with_index do |letter, index|
  PRIORITY[letter] = lowercase_num[index]
end

uppercase.each_with_index do |letter, index|
  PRIORITY[letter] = uppercase_num[index]
end

def rucksack_items
  file = File.readlines('input.txt',  chomp: true)
  input = file.map do |rucksack|
    size = (rucksack.length + 1)/2
    rucksack.chars.each_slice(size).to_a.map do |splice|
      splice.map { |bag| bag.chars }
    end
  end
  input
end

def same_items
  rucksack_items.map do |rucksack|
    rucksack.reduce(&:&).first
  end
end

def rucksack_groupings
  file = File.readlines('input.txt',  chomp: true)
  file.each_slice(3).to_a.map do |splice|
    splice.map { |bag| bag.chars }
  end
end

def group_items
  rucksack_groupings.map do |rucksack|
    rucksack.reduce(&:&)
  end
end


def priority(letters_array)
  priority = 0
  letters_array.flatten.each do |letter|
    priority += PRIORITY[letter]
  end
  priority
end

p priority(same_items)
p priority(group_items)
