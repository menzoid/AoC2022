SAMPLE = {}
SAMPLE[1] = %w(Z N)
SAMPLE[2] = %w(M C D)
SAMPLE[3] = %w(P)

puts "here is my sample stack hash"
p SAMPLE

STACK = {}
STACK[1] = %w(M J C B F R L H)
STACK[2] = %w(Z C D)
STACK[3] = %w(H J F C N G W)
STACK[4] = %w(P J D M T S B)
STACK[5] = %w(N C D R J)
STACK[6] = %w(W L D Q P J G Z)
STACK[7] = %w(P Z T F R H)
STACK[8] = %w(L V M G)
STACK[9] = %w(C B G P F Q R J)

puts "here is my input stack hash"
p STACK

def rearrangement_procedure
  file = File.readlines('inputprocedure.txt', chomp: true)
  input = file.map do |line|
    numbers = line.split(" ")
    numbers.delete("move")
    numbers.delete("from")
    numbers.delete("to")
    numbers.map(&:to_i)
  end
  input
end

def single_step(instruction, stack)
  instruction[0].times do
    removed_crate = stack[instruction[1]].pop
    stack[instruction[2]].push(removed_crate)
  end
end

def rearrange(stack)
  rearrangement_procedure.each do |instruction|
    single_step(instruction, stack)
  end
  stack
end

def single_step_9001(instruction, stack)
    removed_crates = stack[instruction[1]].pop(instruction[0])
    removed_crates.each do |crate|
      stack[instruction[2]].push(crate)
    end
end

def rearrange_9001(stack)
  rearrangement_procedure.each do |instruction|
    single_step_9001(instruction, stack)
  end
  stack
end
