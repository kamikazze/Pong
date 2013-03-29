class PongBall {

  private float x = 0;
  private float y = 0;
  private float radius = 0;
  private float speedX = 10;
  private float speedY = 10;
  private int xDirection = 1;
  private int yDirection = 1;
  private float effet = 0.5;

  public PongBall(float ballX, float ballY, float ballSize) {
    this.x = ballX;
    this.y = ballY;
    this.radius = ballSize;
  }
  
  private void updateX(){
    this.x = this.x + this.speedX * this.xDirection * this.effet;
  }
  
  private void updateY(){
    this.y = this.y + this.speedY * this.yDirection * this.effet;
  }

  public void setX(float newX) {
    this.x = newX;
  }

  public void setY(float newY) {
    this.y = newY;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public void setXDirection(int newXDirection) {
    this.xDirection = newXDirection;
  }

  public void setYDirection(int newYDirection) {
    this.yDirection = newYDirection;
  }

  public int getXDirection() {
    return this.xDirection;
  }

  public int getYDirection() {
    return this.yDirection;
  }

  public void setEffet(float newEffet) {
    this.effet = newEffet;
  }

  public float getEffet() {
    return this.effet;
  }
  
  public void setSpeedX(float newSpeedX){
    this.speedX = newSpeedX;
  }
  
  public float getSpeedX(){
    return this.speedX;
  }
  
  public void setSpeedY(float newSpeedY){
    this.speedY = newSpeedY;
  }
  
  public float getSpeedY(){
    return this.speedY;
  }

  public void draw() {
    this.updateY();
    this.updateX();
    ellipse(this.x, this.y, this.radius, this.radius);
  }
}

