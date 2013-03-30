class PongBall {


  private PVector position;
  private float radius = 0;
  private float speedX = 10;
  private float speedY = 10;
  private int xDirection = 1;
  private int yDirection = 1;
  private float effet = 1;

  public PongBall(float ballX, float ballY, float ballSize) {
    this.position = new PVector(ballX, ballY);
    this.radius = ballSize /2 ;
  }

  public float getLowerSide() {
    return this.position.y - this.radius;
  }

  public float getUpperSide() {
    return this.position.y + this.radius;
  }

  public float getRightSide() {
    return this.position.x + this.radius;
  }

  public float getLeftSide() {
    return this.position.x - this.radius;
  }

  private void updateX() {
    this.position.x = this.position.x + this.speedX * this.xDirection * this.effet;
  }

  private void updateY() {
    this.position.y = this.position.y + this.speedY * this.yDirection * this.effet;
  }

  public void reverseXDirection() {
    this.xDirection = -this.xDirection;
  }

  public void reverseYDirection() {
    this.yDirection = -this.yDirection;
  }

  public void setX(float newX) {
    this.position.x = newX;
  }

  public void setY(float newY) {
    this.position.y = newY;
  }

  public float getX() {
    return this.position.x;
  }

  public float getY() {
    return this.position.y;
  }
  
  public float getRadius(){
   return this.radius;
  }

  public void setEffet(float newEffet) {
    this.effet = newEffet;
  }

  public float getEffet() {
    return this.effet;
  }

  public void setSpeedX(float newSpeedX) {
    this.speedX = newSpeedX;
  }

  public void setSpeedY(float newSpeedY) {
    this.speedY = newSpeedY;
  }

  public void draw() {
    this.updateY();
    this.updateX();
    ellipse(this.position.x, this.position.y, this.radius, this.radius);
  }
}

