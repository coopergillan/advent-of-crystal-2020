# Advent of Code 2020 Day 1 parts one and two
require "dir"
require "file"
require "path"

FILE_PATH = Path.new(Dir.current, "day_2", "source_data.txt")

module Day2
  class InputValidator
    def initialize(input : String)
      @lower_bound = 0
      @upper_bound = 0
      @letter = ""
      @password = ""

      raw_range, raw_letter, raw_password = input.split(" ")

      @lower_bound, @upper_bound = raw_range.split("-").map { |bound| bound.to_i }
      @letter = raw_letter.rstrip(":")
      @password = raw_password
    end

    # Pretty sure there is a more crystal way to do all these setters, but
    # since the input is only parsed and not a property, I wasn't able to
    # get it with the time allowed
    def lower_bound
      @lower_bound
    end

    def upper_bound
      @upper_bound
    end

    def letter
      @letter
    end

    def password
      @password
    end

    def password_valid?
      @password.count(@letter) <= @upper_bound && @password.count(@letter) >= @lower_bound
    end
  end

  class Checker
    property valid_passwords
    property input_file : Path

    def initialize(@input_file)
      @valid_passwords = 0
    end

    def check_input
      File.open(input_file) do |file|
        file.each_line do |line|
          validator = InputValidator.new(line)
          if validator.password_valid?
            @valid_passwords += 1
          end
        end
      end
      puts "Found #{valid_passwords} valid passwords in #{input_file}"
    end
  end
end

# main function
main_checker = Day2::Checker.new(FILE_PATH)
main_checker.check_input
