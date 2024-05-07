$LOAD_PATH << "./lib"
require "robot"
require "table"
require "commands/place"
require "commands/report"

class Main
  robot = Robot.new
  table = Table.new

  loop do
    command = gets.chomp
    case command
    when /^PLACE/
      args = command.split(" ")[1].split(",")
      Place.call(table, robot, *args)
    when "MOVE"
    when "LEFT", "RIGHT"
    when "REPORT"
      Report.call(robot)
    else
      puts "invalid"
    end

    break if command == "EXIT"
  end
end