# Advent of Code 2020 Day 2 part one
require "spec"
require "../../day_2"

describe Day2::InputValidator do
  describe "#initialize" do
    it "sets attributes correctly" do
      input = "1-3 g: abcdefg"
      validator = Day2::InputValidator.new(input)

      validator.lower_bound.should eq 1
      validator.upper_bound.should eq 3
      validator.letter.should eq "g"
      validator.password.should eq "abcdefg"
    end
  end

  describe "#password_valid?" do
    it "checks if password is valid" do
      input = "1-3 g: abcdefg"
      validator = Day2::InputValidator.new(input)

      validator.password_valid?.should be_true
    end

    it "checks if password is invalid" do
      input = "2-3 g: abcdefg"
      validator = Day2::InputValidator.new(input)

      validator.password_valid?.should be_false
    end
  end
end

describe Day2::Checker do
  describe "#initialize" do
    it "sets attributes correctly" do
      checker = Day2::Checker.new(Path.new("fake_file.txt"))

      checker.valid_passwords.should eq 0
      checker.input_file.should eq Path["fake_file.txt"]
    end
  end

  describe "#check_input" do
    it "checks input file and counts valid passwords" do
      input_file = Path.new(Dir.current, "spec", "day_2", "spec_input.txt")
      checker = Day2::Checker.new(input_file)

      checker.check_input
      checker.valid_passwords.should eq 2
    end
  end
end
