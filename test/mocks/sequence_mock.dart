part of mocks;

class SequenceMock extends Sequence {
  SequenceMock(List<Behavior> children) : super(new BlackboardMock(), children); 
}
