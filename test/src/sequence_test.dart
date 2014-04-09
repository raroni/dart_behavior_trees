library sequence_test;

import 'package:unittest/unittest.dart';

import 'package:behavior_trees/behavior_trees.dart';
import './dummy_behavior.dart';

Behavior createDummyBehavior(Status status) {
  var behavior = new DummyBehavior();
  behavior.nextStatus = status;
  return behavior;
}

void main() {
  test("success", () {
    var behavior1 = createDummyBehavior(Status.SUCCESS);
    var behavior2 = createDummyBehavior(Status.SUCCESS);
    var behavior3 = createDummyBehavior(Status.SUCCESS);
    
    var sequence = new Sequence([behavior1, behavior2, behavior3]);
    var status = sequence.update();
    
    expect(status, equals(Status.SUCCESS));
    expect(behavior1.updateCalls, equals(1));
    expect(behavior2.updateCalls, equals(1));
    expect(behavior3.updateCalls, equals(1));
  });
  
  test("running", () {
    var behavior1 = createDummyBehavior(Status.SUCCESS);
    var behavior2 = createDummyBehavior(Status.SUCCESS);
    var behavior3 = createDummyBehavior(Status.RUNNING);
    var behavior4 = createDummyBehavior(Status.FAILURE);
    
    var sequence = new Sequence([behavior1, behavior2, behavior3, behavior4]);
    var status = sequence.update();
    
    expect(status, equals(Status.RUNNING));
    expect(sequence.currentChildIndex, 2);
    
    expect(behavior1.updateCalls, equals(1));
    expect(behavior2.updateCalls, equals(1));
    expect(behavior3.updateCalls, equals(1));
    expect(behavior4.updateCalls, equals(0));
  });
  
  test("failure", () {
    var behavior1 = createDummyBehavior(Status.SUCCESS);
    var behavior2 = createDummyBehavior(Status.SUCCESS);
    var behavior3 = createDummyBehavior(Status.FAILURE);
    var behavior4 = createDummyBehavior(Status.SUCCESS);
    
    var sequence = new Sequence([behavior1, behavior2, behavior3, behavior4]);
    var status = sequence.update();
    
    expect(status, equals(Status.FAILURE));
    expect(sequence.currentChildIndex, 2);
    
    expect(behavior1.updateCalls, equals(1));
    expect(behavior2.updateCalls, equals(1));
    expect(behavior3.updateCalls, equals(1));
    expect(behavior4.updateCalls, equals(0));
  });
}
