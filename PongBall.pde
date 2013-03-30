class PongBall {


  private PVector position;
  private float radius = 0;
  private float speed = 10;
  private PVector direction;
  private float effet = 1;

  public PongBall(float ballX, float ballY, float ballSize) {
    this.direction = new PVector(1,1);
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
    this.position.x = this.position.x + this.speed * this.direction.x * this.effet;
  }

  private void updateY() {
    this.position.y = this.position.y + this.speed * this.direction.y * this.effet;
  }

  public void reverseXDirection() {
    this.direction.x = -this.direction.x;
  }

  public void reverseYDirection() {
    this.direction.y = -this.direction.y;
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

  public void draw() {
    this.updateY();
    this.updateX();
    ellipse(this.position.x, this.position.y, this.radius, this.radius);
  }
}

