def signal_instructions
  file = File.readlines('input.txt', chomp: true)
  input = file.map {_1.split(" ") }
end

p signal_instructions

SIGNAL_STRENGTH = { }

def signal_strengths
  x = 1
  cycle = 0
  signal_instructions.each do |instruction|
    if instruction[0] == "noop"
      cycle += 1
      SIGNAL_STRENGTH[cycle] = x if cycle % 40 == 20
      # p "#{cycle}: x = #{x}"
    else
      2.times do
        cycle += 1
        SIGNAL_STRENGTH[cycle] = x if cycle % 40 == 20
        # p "#{cycle}: x = #{x}"
      end
      x += instruction[1].to_i
    end
  end
end

# p SIGNAL_STRENGTH
# signal_strengths
# p SIGNAL_STRENGTH

def signal_strength_sum
  sum = 0
  SIGNAL_STRENGTH.each do |cycle, strength|
    sum += cycle.to_i * strength
  end
  sum
end

# p signal_strength_sum

# SCREEN = Array.new(6) { Array.new(40, '.') }

# def pixel_positions_2d_array
#   sprite_center = [0,1]
#   pixel_position = [0,0]
#   cycle = 0

#   signal_instructions.each do |instruction|
#     sprite_left = [sprite_center[0], sprite_center[1]-1]
#     sprite_right = [sprite_center[0], sprite_center[1]+1]
#     p instruction
#     if instruction[0] == "noop"
#       pixel_position[1] += 1
#       cycle += 1
#       p cycle
#       if cycle % 40 == 0
#         pixel_position[1] = 0
#         sprite_center[0] += 1
#         pixel_position[0] += 1
#       end

#       p "pix: #{pixel_position}; sprite_center = #{sprite_center}"

#       if pixel_position == sprite_center || pixel_position == sprite_right || pixel_position == sprite_left
#         SCREEN[pixel_position[0]][pixel_position[1]] = "#"
#       end
#     else
#       2.times do
#         pixel_position[1] += 1

#         cycle += 1
#         p cycle
#         if cycle % 40 == 0
#           pixel_position[1] = 0
#           sprite_center[0] += 1
#           pixel_position[0] += 1
#         end

#         p "pix: #{pixel_position}; sprite_center = #{sprite_center}"

#         if pixel_position == sprite_center || pixel_position == sprite_right || pixel_position == sprite_left
#           SCREEN[pixel_position[0]][pixel_position[1]] = "#"
#         end
#       end
#       sprite_center[1] += instruction[1].to_i
#     end
#   end
# end

SCREEN = []

def pixel_positions
  x = 1
  pixel_position = 0
  cycle = 0
  signal_instructions.each do |instruction|
    sprite = [x-1,x,x+1]
    p instruction
    if instruction[0] == "noop"
      # p pixel_position
      # p sprite
      if pixel_position == sprite[0] || pixel_position == sprite[1] || pixel_position == sprite[2]
        SCREEN << "#"
      else
        SCREEN << "."
      end

      pixel_position += 1
      if pixel_position % 40 == 0
        pixel_position = 0
      end
    else
      2.times do
        # p pixel_position
        # p sprite
        if pixel_position == sprite[0] || pixel_position == sprite[1] || pixel_position == sprite[2]
          SCREEN << "#"
        else
          SCREEN << "."
        end

        pixel_position += 1
        if pixel_position % 40 == 0
          pixel_position = 0
        end

      end
      x += instruction[1].to_i
    end
  end
  SCREEN
end

def screen_view
  pixel_positions.each_slice(40).to_a.map(&:join)
end

p screen_view
