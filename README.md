# Toy Robot

An application that simulates a toy robot that can be placed on and moved around a table via standard input.

## Installation
Run the following commands in your terminal

Clone the repository
```shell
git clone https://github.com/humesy/toy-robot.git
cd toy-robot
```
Ensure ruby version 3.3.1 is being used. If it is not, install it via your preferred version manager
```shell
ruby -v
```

Install dependencies
```shell
bundle
```

## Usage

Run the program via
```shell
ruby lib/main.rb
```

Once running, you can input commands and submit by pressing enter. Valid commands are:
1. PLACE X,Y,DIRECTION - places the robot at the given location facing in the given direction
   1. X and Y being integers, DIRECTION being one of NORTH, SOUTH, EAST or WEST (e.g. PLACE 1,2,WEST)
2. MOVE - moves the robot 1 unit in the direction it is currently facing
3. LEFT - rotates the direction the robot is facing left
4. RIGHT - rotates the direction the robot is facing right
5. REPORT - outputs the current position and direction of the robot
6. EXIT - stops the simulation

### Constraints
* All inputs will be ignored until a valid PLACE command has been called
* The table has a width and height of 5 units (this is reported as 0-4)
* The robot can be facing in any of the cardinal directions (north, south, east, west)
* Any input that would cause the robot to leave the boundaries of the table is ignored
* Inputs are case sensitive
* Any invalid input that does not match the above formats is ignored


## Testing

Software tests can be run via
```shell
rspec
```

Example test input and output cases are provided in test_data.txt