library concurrent_test;

import 'package:unittest/unittest.dart';
import 'package:behavior_trees/behavior_trees.dart';
import '../mocks.dart';

void main() {
  test("it gives up at first failure", () {
    var concurrent = new ConcurrentMock(4, Status.SUCCESS);
    concurrent[2].nextStatus = Status.FAILURE;
    
    var status = concurrent.update();
    
    expect(status, equals(Status.FAILURE));
    expect(concurrent[0].status, equals(Status.SUCCESS));
    expect(concurrent[1].status, equals(Status.SUCCESS));
    expect(concurrent[2].status, equals(Status.FAILURE));
    expect(concurrent[3].status, equals(Status.UNINITIALIZED));
  });
  
  test("it returns last childs result if no failures", () {
    var concurrent = new ConcurrentMock(3, Status.SUCCESS);
    var status = concurrent.update();
    
    expect(status, equals(Status.SUCCESS));
    
    concurrent[2].nextStatus = Status.RUNNING;
    status = concurrent.update();
    expect(status, equals(Status.RUNNING));
  });
}
