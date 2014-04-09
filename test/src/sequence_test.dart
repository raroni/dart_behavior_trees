library sequence_test;

import 'package:unittest/unittest.dart';

import 'package:behavior_trees/behavior_trees.dart';
import '../mocks.dart';

void main() {
  test("success", () {
    var behavior1 = new BehaviorMock(Status.SUCCESS);
    var behavior2 = new BehaviorMock(Status.SUCCESS);
    var behavior3 = new BehaviorMock(Status.SUCCESS);
    
    var sequence = new Sequence([behavior1, behavior2, behavior3]);
    var status = sequence.update();
    
    expect(status, equals(Status.SUCCESS));
    expect(behavior1.statusCalls, equals(1));
    expect(behavior2.statusCalls, equals(1));
    expect(behavior3.statusCalls, equals(1));
  });
  
  test("running", () {
    var behavior1 = new BehaviorMock(Status.SUCCESS);
    var behavior2 = new BehaviorMock(Status.SUCCESS);
    var behavior3 = new BehaviorMock(Status.RUNNING);
    var behavior4 = new BehaviorMock(Status.FAILURE);
    
    var sequence = new Sequence([behavior1, behavior2, behavior3, behavior4]);
    var status = sequence.update();
    
    expect(status, equals(Status.RUNNING));
    expect(sequence.currentChildIndex, 2);
    
    expect(behavior1.statusCalls, equals(1));
    expect(behavior2.statusCalls, equals(1));
    expect(behavior3.statusCalls, equals(1));
    expect(behavior4.statusCalls, equals(0));
  });
  
  test("failure", () {
    var behavior1 = new BehaviorMock(Status.SUCCESS);
    var behavior2 = new BehaviorMock(Status.SUCCESS);
    var behavior3 = new BehaviorMock(Status.FAILURE);
    var behavior4 = new BehaviorMock(Status.SUCCESS);
    
    var sequence = new SequenceMock([behavior1, behavior2, behavior3, behavior4]);
    var status = sequence.update();
    
    expect(status, equals(Status.FAILURE));
    expect(sequence.currentChildIndex, 2);
    
    expect(behavior1.statusCalls, equals(1));
    expect(behavior2.statusCalls, equals(1));
    expect(behavior3.statusCalls, equals(1));
    expect(behavior4.statusCalls, equals(0));
  });
}
