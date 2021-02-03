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

def find_sum_elements(source_numbers, desired_sum = 2020)
  matches = Tuple.new

  source_numbers.each_with_index do |number, index|
    needed = desired_sum - number
    if source_numbers.includes? needed
      product = number * needed
      puts "Found #{needed} match with #{number} for product #{product}"
      return product
    end
  end
end

def answer_part_1
  source_numbers = store_source(FILE_PATH)

  answer = find_sum_elements(source_numbers)
  puts "Found answer: #{answer}"
end

puts "Answering part 1:"
answer_part_1
