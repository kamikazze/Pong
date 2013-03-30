class PongPaddle {

  private float sizeX;
  private float sizeY;
  private PVector position;
  private float speed = 10;

  public PongPaddle(float x, float y, float sizeX, float sizeY) {
    this.position = new PVector(x, y);
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }

  public void draw() {
    rectMode(CENTER);
    rect(this.position.x, this.position.y, sizeX, sizeY);
  }

  private float getUpperSide() {
    return this.position.y + this.sizeY/2;
  }

  private float getLowerSide() {
    return this.position.y - this.sizeY/2;
  }

  private float getLeftSide() {
    return this.position.x - this.sizeX/2;
  }

  private float getRightSide() {
    return this.position.x + this.sizeX/2;
  }

  public void moveUp() {
    this.position.y += speed;
  }

  public void moveDown() {
    this.position.y -= speed;
  }

  private boolean ballIsWithinXRange(PongBall ball) {
    if (ball.getRightSide() >= this.getLeftSide() && ball.getLeftSide() <= this.getRightSide()) {
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
      if (this.getRightSide() >= ball.getLeftSide() && this.getRightSide() <= ball.getRightSide()) {
        return true;
      }
    }
    return false;
  }  


  public void setX(float x) {
    this.position.x = x;
  }

  public float getX() {
    return this.position.x;
  }

  public void setY(float y) {
    this.position.y = y;
  }

  public float getY() {
    return this.position.y;
  }

  public float getSizeX() {
    return this.sizeX;
  }

  public float getSizeY() {
    return this.sizeY;
  }
}

