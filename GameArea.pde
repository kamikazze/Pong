class GameArea {

  private int maxX;
  private int maxY;

  public GameArea(int sizeX, int sizeY) {
    this.maxX = sizeX-1;
    this.maxY = sizeY-1;
  }

  public boolean ballTouchesRightSide(PongBall ball) {
    if (ball.getX() > this.maxX - ball.getRadius()/2 ) {
      return true;
    }
   return false; 
  }
  
  public boolean ballTouchesLeftSide(PongBall ball){
   if (ball.getX() < 0 + ball.getRadius()/2) {
      return true;
    }
    return false;
  }

  public boolean ballTouchesUpperSide(PongBall ball) {
    if (ball.getY() < 0 + ball.getRadius()/2) {
      return true;
    }
    return false;
  }
  
  public boolean ballTouchesLowerSide(PongBall ball){
      if (ball.getY() > this.maxY - ball.getRadius()/2 ) {
      return true;
    } 
  return false;
  }  
}

