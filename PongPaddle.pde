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
  
  public void moveUp(){
    this.y += speed;
  }
  
  public void moveDown(){
   this.y -= speed;
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
  
  public float getSizeX(){
    return this.sizeX;
  }
  
  public float getSizeY(){
    return this.sizeY;
  }
}

