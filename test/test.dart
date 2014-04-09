import 'package:unittest/unittest.dart';

import 'src/behavior_test.dart' as BehaviorTest;
import 'src/sequence_test.dart' as SequenceTest;
import 'src/selector_test.dart' as SelectorTest;
import 'src/priority_selector_test.dart' as PrioritySelectorTest;

main() {
  group('Behavior test', BehaviorTest.main);
  group('Sequence test', SequenceTest.main);
  group('Selector test', SelectorTest.main);
  group('Priority selector test', PrioritySelectorTest.main);
}
