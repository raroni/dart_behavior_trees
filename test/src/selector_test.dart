library selector_test;

import 'package:unittest/unittest.dart';
import 'package:behavior_trees/behavior_trees.dart';
import '../mocks.dart';

void main() {
  test("uses first running", () {
    var selector = new SelectorMock(2, Status.FAILURE);
    selector[1].nextStatus = Status.RUNNING;
    
    var status = selector.update();
    
    expect(status, equals(Status.RUNNING));
    expect(selector.currentChildIndex, 1);
    expect(selector[0].initializeCalls, equals(1));
    expect(selector[1].initializeCalls, equals(1));
  });
}
