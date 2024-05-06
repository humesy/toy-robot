class Main
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