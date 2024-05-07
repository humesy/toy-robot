RSpec.describe ParseInput do
  let(:robot) { Robot.new }
  let(:table) { Table.new }

  describe ".call" do
    context "MOVE input" do
      it "calls move command with correct arguments" do
        expect(Move).to receive(:call).with(robot, table)

        described_class.call("MOVE", robot, table)
      end
    end

    context "PLACE input" do
      it "does nothing for too few arguments" do
        expect(Place).to_not receive(:call)

        described_class.call("PLACE 1,2", robot, table)
      end

      it "does nothing for too many arguments" do
        expect(Place).to_not receive(:call)

        described_class.call("PLACE 1,2,WEST,EAST", robot, table)
      end

      it "calls place command with correct arguments" do
        expect(Place).to receive(:call).with(robot, table, "1", "2", "WEST")

        described_class.call("PLACE 1,2,WEST", robot, table)
      end
    end

    context "REPORT input" do
      it "calls report command with correct arguments" do
        expect(Report).to receive(:call).with(robot)

        described_class.call("REPORT", robot, table)
      end
    end

    context "LEFT input" do
      it "calls rotate command with correct arguments" do
        expect(Rotate).to receive(:call).with(robot, "LEFT")

        described_class.call("LEFT", robot, table)
      end
    end

    context "RIGHT input" do
      it "calls rotate command with correct arguments" do
        expect(Rotate).to receive(:call).with(robot, "RIGHT")

        described_class.call("RIGHT", robot, table)
      end
    end

    context "invalid input" do
      it "does nothing" do
        expect(Place).to_not receive(:call)
        expect(Move).to_not receive(:call)
        expect(Report).to_not receive(:call)
        expect(Rotate).to_not receive(:call)

        described_class.call("BAD INPUT", robot, table)
      end
    end
  end
end
