class PongPaddle {


  private float sizeX;
  private float sizeY;
  private float x;
  private float y;
  private float speed = 10;

  public PongPaddle(float x, float y, float sizeX, float sizeY) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }

  public void draw() {
    rectMode(CENTER);
    rect(x, y, sizeX, sizeY);
  }

  private float getUpperSide() {
    return this.y + this.sizeY/2;
  }

  private float getLowerSide() {
    return this.y - this.sizeY/2;
  }

  private float getLeftSide() {
    return this.x - this.sizeX/2;
  }

  private float getRightSide() {
    return this.x + this.sizeX/2;
  }

  public void moveUp() {
    this.y += speed;
  }

  public void moveDown() {
    this.y -= speed;
  }

  private boolean ballIsWithinXRange(PongBall ball) {
    if (ball.getRightSide() >= this.getLeftSide() && ball.getLeftSide() <= this.getRightSide()) {
      println("X-Range");
      return true;
    } 
    return false;
  }

  private boolean ballIsWithinYRange(PongBall ball) {
    if (ball.getUpperSide() >= this.getLowerSide() && ball.getLowerSide() <= this.getUpperSide()) {
      return true;
    }
    return false;
  }

  public boolean ballTouchesLower(PongBall ball) {
    if (this.ballIsWithinXRange(ball)  && this.ballIsWithinYRange(ball)) {
      if (this.getUpperSide() >= ball.getLowerSide() && this.getUpperSide() <= ball.getUpperSide()) {
        return true;
      }
    }
    return false;
  }

  public boolean ballTouchesUpper(PongBall ball) {
    if (this.ballIsWithinXRange(ball) && this.ballIsWithinYRange(ball)) {
      if (this.getLowerSide() <= ball.getUpperSide() && this.getLowerSide() >= ball.getLowerSide()) {
        return true;
      }
    }
    return false;
  }  

  public boolean ballTouchesLeft(PongBall ball) {
    if (this.ballIsWithinYRange(ball)  && this.ballIsWithinXRange(ball)) {
      if (this.getLeftSide() <= ball.getRightSide() && this.getLeftSide() >= ball.getLeftSide()) {
        return true;
      }
    }
    return false;
  }

  public boolean ballTouchesRight(PongBall ball) {
    if (this.ballIsWithinYRange(ball)  && this.ballIsWithinXRange(ball)) {
      if (this.getRightSide() >= ball.getLeftSide() && this.getRightSide() <= ball.getLeftSide()) {
        return true;
      }
    }
    return false;
  }  



  public void setX(float x) {
    this.x = x;
  }

  public float getX() {
    return this.x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public float getY() {
    return this.y;
  }

  public float getSizeX() {
    return this.sizeX;
  }

  public float getSizeY() {
    return this.sizeY;
  }
}

