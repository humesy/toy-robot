require "commands/place"
require "commands/report"
require "commands/rotate"
require "commands/move"

class ParseInput
  def self.call(...)
    new(...).call
  end

  def initialize(input, robot, table)
    @input = input
    @robot = robot
    @table = table
  end

  def call
    case @input
    when "MOVE"
      Move.call(@robot, @table)
    when /^PLACE/
      return unless place_args.length == 3
      Place.call(@robot, @table, *place_args)
    when "REPORT"
      Report.call(@robot)
    when "LEFT", "RIGHT"
      Rotate.call(@robot, @input)
    else
      return
    end
  end

  private

  def place_args
    @place_args ||= @input.split(" ")[1].split(",")
  end
end
