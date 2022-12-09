def rows
  file = File.readlines('input.txt', chomp: true)
  file.map do |row|
    row.chars.map(&:to_i)
  end
end

def columns
  rows.transpose
end

def perimeter_count
  visible = 0
  rows.each_with_index do |row, index|
    row_index = index
    row.each_with_index do |tree_height, index|
      column_index = index
      visible += 1 if (row_index == 0 || row_index == row.length - 1) || (column_index == 0 || column_index == rows.length - 1)
    end
  end
  return visible
end

def visible_tree?(row_index, col_index)
  tree_in_row = rows[row_index][col_index]
  tree_in_col = columns[col_index][row_index]

  # true if heighest of all to the left
  left_row_slice = rows[row_index][0..col_index]
  return true if left_row_slice.max() == tree_in_row && left_row_slice.count(tree_in_row) == 1

  # true if heighest of all to the right
  right_row_slice = rows[row_index][col_index..-1]
  return true if right_row_slice.max() == tree_in_row && right_row_slice.count(tree_in_row) == 1

  # true if heighest of all to the left
  left_col_slice = columns[col_index][0..row_index]
  return true if left_col_slice.max() == tree_in_col && left_col_slice.count(tree_in_col) == 1

  # true if heighest of all to the right
  right_col_slice = columns[col_index][row_index..-1]
  return true if right_col_slice.max() == tree_in_col && right_col_slice.count(tree_in_col) == 1
end

def interior_count
  visible = 0
  rows.each_with_index do |row, index|
    row_index = index
    row.each_with_index do |tree_height, index|
      col_index = index
      unless (row_index == 0 || row_index == row.length - 1) || (col_index == 0 || col_index == rows.length - 1)
        visible += 1 if visible_tree?(row_index, col_index)
      end
    end
  end
  return visible
end

def total_visible_count
  perimeter_count + interior_count
end

def scenic_score(row_index, col_index)
  tree_in_row = rows[row_index][col_index]
  tree_in_col = columns[col_index][row_index]

  left_row_slice = rows[row_index][0..col_index-1].reverse
  left_row_slice_count = 0
  left_row_slice.each do |tree_height|
    left_row_slice_count += 1
    break if tree_height >= tree_in_row
  end

  # 5,3,3,5,5 - 3
  #   3,3,5,5
  #    ,3,5,5
  # p tree_in_row
  # p left_row_slice
  # p left_row_slice_count

  # true if heighest of all to the right
  right_row_slice = rows[row_index][col_index+1..-1]
  right_row_slice_count = 0
  right_row_slice.each do |tree_height|
    right_row_slice_count += 1
    break if tree_height >= tree_in_row
  end

  # p tree_in_row
  # p right_row_slice
  # p right_row_slice_count

  # true if heighest of all to the left
  left_col_slice = columns[col_index][0..row_index-1].reverse
  left_col_slice_count = 0
  left_col_slice.each do |tree_height|
    left_col_slice_count += 1
    break if tree_height >= tree_in_col
  end

  # p tree_in_col
  # p left_col_slice
  # p left_col_slice_count

  # true if heighest of all to the right
  right_col_slice = columns[col_index][row_index+1..-1]
  right_col_slice_count = 0
  right_col_slice.each do |tree_height|
    right_col_slice_count += 1
    break if tree_height >= tree_in_col
  end

  # p tree_in_col
  # p right_col_slice
  # p right_col_slice_count

  left_row_slice_count * right_row_slice_count * left_col_slice_count * right_col_slice_count
end


def max_scenic_score
  scenic_score = []
  rows.each_with_index do |row, index|
    row_index = index
    row.each_with_index do |_tree_height, index|
      col_index = index
      unless (row_index == 0 || row_index == row.length - 1) || (col_index == 0 || col_index == rows.length - 1)
        scenic_score << scenic_score(row_index, col_index)
      end
    end
  end
  return scenic_score.max()
end

# p scenic_score(3,2)
p max_scenic_score
