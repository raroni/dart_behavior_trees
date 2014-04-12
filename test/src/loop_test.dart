library loop_test;

import 'package:unittest/unittest.dart';
import 'package:behavior_trees/behavior_trees.dart';
import '../mocks.dart';

void main() {
  test("looping", () {
    var loop = new LoopMock(3, Status.SUCCESS);
    loop[2].nextStatus = Status.RUNNING;
    
    var result = loop.update();
    expect(result, Status.RUNNING);
    
    loop[2].nextStatus = Status.SUCCESS;
    loop[1].nextStatus = Status.RUNNING;
    
    result = loop.update();
    expect(result, Status.RUNNING);
  });
  
  test("it fails", () {
    var loop = new LoopMock(2, Status.FAILURE);
    var result = loop.update();
    expect(result, Status.FAILURE);
  });
}
