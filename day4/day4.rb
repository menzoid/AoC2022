def pair_section_ids
  file = File.readlines('input.txt', chomp: true)
  file.map do |pair|
    pair.split(',').map do |range|
      pairs = range.split('-').map(&:to_i)
      pairs[0]..pairs[1]
    end
  end
end

def fully_contained?(pair)
  (pair[0]).cover?(pair[1]) || (pair[1]).cover?(pair[0])
end

def fully_contained_pairs
  sum = 0
  pair_section_ids.each do |pair|
    sum += 1 if fully_contained?(pair)
  end
  sum
end

p fully_contained_pairs

def ranges_overlap?(pair)
  pair[1].begin <= pair[0].end && pair[0].begin <= pair[1].end ||
    pair[0].begin <= pair[1].end && pair[1].begin <= pair[0].end
end

def overlapping_ranges
  sum = 0
  pair_section_ids.each do |pair|
    sum += 1 if ranges_overlap?(pair)
  end
  sum
end

p overlapping_ranges
