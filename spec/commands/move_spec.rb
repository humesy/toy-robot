RSpec.describe Move do
  let(:robot) { Robot.new }
  let(:table) { Table.new }

  describe ".call" do
    context "when robot is not on table" do
      it "does nothing" do
        described_class.call(robot, table)

        expect(robot.x_position).to be_nil
        expect(robot.y_position).to be_nil
      end
    end

    context "when robot is on table" do
      context "invalid move" do
        it "does not move when facing north at top of table" do
          robot.set_position!(1, 4)
          robot.set_direction!("NORTH")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 1
          expect(robot.y_position).to eq 4
        end

        it "does not move when facing east at right of table" do
          robot.set_position!(4, 1)
          robot.set_direction!("EAST")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 4
          expect(robot.y_position).to eq 1
        end

        it "does not move when facing south at bottom of table" do
          robot.set_position!(1, 0)
          robot.set_direction!("SOUTH")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 1
          expect(robot.y_position).to eq 0
        end

        it "does not move when facing west at left of table" do
          robot.set_position!(0, 1)
          robot.set_direction!("WEST")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 0
          expect(robot.y_position).to eq 1
        end
      end

      context "valid move" do
        it "moves up when facing north" do
          robot.set_position!(0, 1)
          robot.set_direction!("NORTH")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 0
          expect(robot.y_position).to eq 2
        end

        it "moves right when facing east" do
          robot.set_position!(1, 0)
          robot.set_direction!("EAST")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 2
          expect(robot.y_position).to eq 0
        end

        it "moves down when facing south" do
          robot.set_position!(0, 1)
          robot.set_direction!("SOUTH")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 0
          expect(robot.y_position).to eq 0
        end

        it "moves left when facing west" do
          robot.set_position!(1, 1)
          robot.set_direction!("WEST")

          described_class.call(robot, table)

          expect(robot.x_position).to eq 0
          expect(robot.y_position).to eq 1
        end
      end
    end
  end
end
