import 'dart:io';

final day2Values = [
  for (var line in File('lib/day_2_input.txt').readAsLinesSync())
    if (line.isNotEmpty) Command.parse(line),
];

void main() {
  print('Day 2: Part 1: ${day2Part1()} - Part 2: ${day2Part2()}');
}

int day2Part1() {
  var movement = 0;
  var depth = 0;

  for (var command in day2Values) {
    switch (command.direction) {
      case Direction.down:
        depth += command.amount;
        break;
      case Direction.up:
        depth -= command.amount;
        break;
      case Direction.forward:
        movement += command.amount;
        break;
    }
  }

  return movement * depth;
}

int day2Part2() {
  var movement = 0;
  var depth = 0;
  var aim = 0;

  for (var command in day2Values) {
    switch (command.direction) {
      case Direction.down:
        aim += command.amount;
        break;
      case Direction.up:
        aim -= command.amount;
        break;
      case Direction.forward:
        movement += command.amount;
        depth += command.amount * aim;
        break;
    }
  }

  return movement * depth;
}

class Command {
  final int amount;
  final Direction direction;

  Command(this.direction, this.amount);

  factory Command.parse(String line) {
    var parts = line.split(' ');
    Direction dir;
    switch (parts[0]) {
      case 'down':
        dir = Direction.down;
        break;
      case 'up':
        dir = Direction.up;
        break;
      case 'forward':
        dir = Direction.forward;
        break;
      default:
        throw StateError('Unknown direction ${parts[0]}');
    }
    return Command(dir, int.parse(parts[1]));
  }
}

enum Direction {
  down,
  up,
  forward,
}
