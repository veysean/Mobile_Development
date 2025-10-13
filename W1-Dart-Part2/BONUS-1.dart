enum Direction { north, east, south, west }

class Robot {
  int x;
  int y;
  Direction direction;

  Robot(this.x, this.y, this.direction);

  void turnRight() {
    direction = Direction.values[(direction.index + 1) % 4];
  }

  void turnLeft() {
    direction = Direction.values[(direction.index - 1 + 4) % 4];
  }

  void advance() {
    switch (direction) {
      case Direction.north:
        y += 1;
        break;
      case Direction.east:
        x += 1;
        break;
      case Direction.south:
        y -= 1;
        break;
      case Direction.west:
        x -= 1;
        break;
    }
  }

  void execute(String instructions) {
    for (var command in instructions.split('')) {
      switch (command) {
        case 'R':
          turnRight();
          break;
        case 'L':
          turnLeft();
          break;
        case 'A':
          advance();
          break;
      }
    }
  }

  void result() {
    print('Final position: ($x, $y)');
    print('Facing: ${direction.name.toUpperCase()}');
  }
}

void main() {

  Robot robot = Robot(7, 3, Direction.north);

  robot.execute("RAALAL");

  robot.result();
}


// enum Direction { north, east, south, west }
 
// void main() {
//   // Initial position {7, 3} and facing north
//   int x = 7;
//   int y = 3;
//   Direction direction = Direction.north;

//   // Example instruction sequence
//   const instructions = "RAALAL";

//   // Process the instructions and get the final position and direction
  

//   // Print the final position and direction
//   print("Final position:  ");
//   print("Facing:  ");
// }
