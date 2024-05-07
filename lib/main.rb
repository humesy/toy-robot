$LOAD_PATH << "./lib"
require "robot"
require "table"
require "commands/place"
require "commands/report"
require "commands/rotate"
require "commands/move"
require "commands/parse_input"

class Main
  robot = Robot.new
  table = Table.new

  loop do
    command = gets.chomp
    break if command == "EXIT"

    ParseInput.call(command, robot, table)
  end
end