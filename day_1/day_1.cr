require "file"

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

source_numbers = store_source("source_data.txt")

answer = find_sum_elements(source_numbers)
puts "Found answer: #{answer}"
