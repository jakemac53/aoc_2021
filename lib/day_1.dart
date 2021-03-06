import 'dart:io';

const day = 1;

final day1Values = [
  for (var line in File('lib/day_${day}_input.txt').readAsLinesSync())
    if (line.isNotEmpty) int.parse(line),
];

void main() {
  print('Day $day: Part 1: ${part1()} - Part 2: ${part2()}');
}

int part1() {
  int sum(int index) =>
      day1Values[index] + day1Values[index + 1] + day1Values[index + 2];
  var count = 0;
  var previousSum = sum(0);
  for (var i = 1; i < day1Values.length - 2; i++) {
    var nextSum = sum(i);
    if (nextSum > previousSum) count++;
    previousSum = nextSum;
  }
  return count;
}

int part2() {
  var count = 0;
  var last = day1Values.first;
  for (var value in day1Values.skip(1)) {
    if (value > last) count++;
    last = value;
  }
  return count;
}
