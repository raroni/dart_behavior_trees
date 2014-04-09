library sequence_test;

import 'package:unittest/unittest.dart';

import 'package:behavior_trees/behavior_trees.dart';
import '../mocks.dart';

void main() {
  test("success", () {
    var sequence = new SequenceMock(3, Status.SUCCESS);
    var status = sequence.update();
    
    expect(status, equals(Status.SUCCESS));
    expect(sequence[0].statusCalls, equals(1));
    expect(sequence[1].statusCalls, equals(1));
    expect(sequence[2].statusCalls, equals(1));
  });
  
  test("running", () {
    var sequence = new SequenceMock(4, Status.SUCCESS);
    sequence[2].nextStatus = Status.RUNNING;
    sequence[3].nextStatus = Status.FAILURE;
    var status = sequence.update();
    
    expect(status, equals(Status.RUNNING));
    expect(sequence.currentChildIndex, 2);
    
    expect(sequence[0].statusCalls, equals(1));
    expect(sequence[1].statusCalls, equals(1));
    expect(sequence[2].statusCalls, equals(1));
    expect(sequence[3].statusCalls, equals(0));
  });
  
  test("failure", () {
    var sequence = new SequenceMock(4, Status.SUCCESS);
    sequence[2].nextStatus = Status.FAILURE;
    sequence[3].nextStatus = Status.SUCCESS;
    var status = sequence.update();
    
    expect(status, equals(Status.FAILURE));
    expect(sequence.currentChildIndex, 2);
    
    expect(sequence[0].statusCalls, equals(1));
    expect(sequence[1].statusCalls, equals(1));
    expect(sequence[2].statusCalls, equals(1));
    expect(sequence[3].statusCalls, equals(0));
  });
}
