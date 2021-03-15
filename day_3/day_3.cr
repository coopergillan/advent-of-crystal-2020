require "file"
require "dir"
require "path"

class InputReader
  property map : Array(Array(String))
  def initialize(input_file: Path)
    File.open(input_file)
end
