# Advent of Code 2020 Day 1 parts one and two
require "dir"
require "file"
require "path"

FILE_PATH = Path.new(Dir.current, "day_1", "source_data.txt")

def store_source(filename)
  source_numbers = [] of Int32

  puts "Opening #{filename} to store source data"
  File.open(filename) do |file|
    file.each_line do |line|
      source_numbers << line.to_i
    end
  end
  source_numbers
end

def find_sum_elements(source_numbers, desired_sum)
  source_numbers.each do |number|
    needed = desired_sum - number
    if source_numbers.includes? needed
      return [needed, number]
    end
  end
  [] of Int32
end

def answer_part_1
  source_numbers = store_source(FILE_PATH)

  matches = find_sum_elements(source_numbers, 2020)
  puts "Found matches #{matches}"

  product = matches[0] * matches[1]
  puts "Found product #{product}"
  product
end

puts "Answering part 1:"
answer_part_1
