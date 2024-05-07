$LOAD_PATH << "./lib"
require "robot"
require "table"

class Main
  robot = Robot.new
  table = Table.new

  loop do
    command = gets.chomp
    case command
    when /^PLACE/
    when "MOVE"
    when "LEFT", "RIGHT"
    when "REPORT"
    else
      puts "invalid"
    end

    break if command == "EXIT"
  end
end