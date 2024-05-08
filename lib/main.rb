$LOAD_PATH << "./lib"
require "robot"
require "table"
require "commands/parse_input"

##
# Main class to run the toy robot program
#
# Loops through inputs until "EXIT" is received

class Main
  robot = Robot.new
  table = Table.new

  loop do
    command = gets.chomp
    break if command == "EXIT"

    ParseInput.call(command, robot, table)
  end
end