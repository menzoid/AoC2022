def datastream_buffer
  file = File.readlines('input.txt', chomp: true)
  file.map { _1.chars }.first
end

def subroutine
  datastream_buffer.each_with_index do |marker, index|
    start = index
    the_end = index + 3
    chunk = datastream_buffer[start..the_end]
    return the_end + 1 if chunk == chunk.uniq
  end
end

def message_marker
  datastream_buffer.each_with_index do |marker, index|
    start = index
    the_end = index + 13
    chunk = datastream_buffer[start..the_end]
    return the_end + 1 if chunk == chunk.uniq
  end
end
