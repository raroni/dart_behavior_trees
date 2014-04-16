part of behavior_trees;

class CacheDecorator<SubjectType, UpdateType extends Update> extends Behavior<SubjectType, UpdateType> {
  Behavior<SubjectType, UpdateType> child;
  num interval;
  num timeLeft = 0;
  Status cachedResult;
  
  CacheDecorator(SubjectType subject, num this.interval, this.child) : super(subject);
  
  Status getStatus(UpdateType update) {
    var result;
    
    timeLeft -= update.frameDuration;
    if(timeLeft <= 0) {
      timeLeft += interval;
      result = child.update(update);
      cachedResult = result;
    } else {
      result = cachedResult;
    }
    
    return result;
  }
}
