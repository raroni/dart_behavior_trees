part of mocks;

class UpdateMock extends Update {
  num nextFrameDuration = 16.0;
  
  UpdateMock([num this.nextFrameDuration]);
  
  num get frameDuration => nextFrameDuration;
}
