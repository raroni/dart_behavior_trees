library branch_test;

import 'package:unittest/unittest.dart';
import '../mocks.dart';

void main() {
  test("add", () {
    var branch = new BranchMock();
    var child = new BehaviorMock();
    branch.add(child);
  });
}
