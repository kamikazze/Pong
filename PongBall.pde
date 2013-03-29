class PongBall {

  private float x = 0;
  private float y = 0;
  private float radius = 0;
  private float speedX = 0.1;
  private float speedY = 0.1;
  private int xDirection = 10;
  private int yDirection = 10;
  private float effet = 1;

  public PongBall(float ballX, float ballY, float ballSize) {
    this.x = ballX;
    this.y = ballY;
    this.radius = ballSize /2 ;
  }
  
  public float getLowerSide() {
    return this.y - this.radius;
  }
  
  public float getUpperSide(){
    return this.y + this.radius;
  }
  
 public float getRightSide(){
   return this.x + this.radius;
 }
 
 public float getLeftSide(){
   return this.x - this.radius;
 }
 
  private void updateX(){
    this.x = this.x + this.speedX * this.xDirection * this.effet;
  }
  
  private void updateY(){
    this.y = this.y + this.speedY * this.yDirection * this.effet;
  }
  
  public void reverseXDirection(){
   this.xDirection = -this.xDirection;
  }
  
  public void reverseYDirection(){
    this.yDirection = -this.yDirection;
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

  public void setEffet(float newEffet) {
    this.effet = newEffet;
  }

  public float getEffet() {
    return this.effet;
  }
  
  public void setSpeedX(float newSpeedX){
    this.speedX = newSpeedX;
  }

  public void setSpeedY(float newSpeedY){
    this.speedY = newSpeedY;
  }

  public void draw() {
    this.updateY();
    this.updateX();
    println(this.getLeftSide() + ":" + this.getRightSide());
    ellipse(this.x, this.y, this.radius, this.radius);
  }
}

