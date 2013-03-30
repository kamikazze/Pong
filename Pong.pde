// testing git again
int screen_x = 600;
int screen_y = 700;
int max_x = screen_x -1;
int max_y = screen_y -1;
float ballSize = 20;
String direction = "rechts";
String directionR = "up";
float rightScore = 0;
float leftScore = 1;
int score_right = 0;
int score_left = 0;
int score_a = 0;
String score_right_text;
String score_left_text;
PFont font;

float dist = 100;

PongBall ball;
PongPaddle leftPaddle;
PongPaddle rightPaddle;
GameArea gameArea;

void setup() {
  size(screen_x, screen_y);
  background(255);
  frameRate(25);
  float paddleSizeX = 100;
  float paddleSizeY = 400;
  font = loadFont("AmericanTypewriter-Light-48.vlw");
  textFont(font);
  gameArea = new GameArea(screen_x, screen_y);
  ball = new PongBall(max_x/2, max_y/2, ballSize);
  leftPaddle = new PongPaddle(paddleSizeX/2 + dist, paddleSizeY/2 +dist, paddleSizeX, paddleSizeY);
  rightPaddle = new PongPaddle(max_x - paddleSizeX/2 -dist, max_y - paddleSizeY/2 -dist, paddleSizeX, paddleSizeY);
}


void draw() {
  background(255);
  rectMode(CENTER);
  shapeMode(CENTER);
  fill(225, 240, 140, 128);

  ball.draw();
  leftPaddle.draw();
  rightPaddle.draw();
  
  if(gameArea.ballTouchesRightSide(ball)){
    score_left += 1;
    ball.reverseXDirection();
  }
  
  if(gameArea.ballTouchesLeftSide(ball)){
    score_right += 1;
    ball.reverseXDirection();
  }
  
  if(gameArea.ballTouchesUpperSide(ball)){
     ball.reverseYDirection();
  }
  
  if(gameArea.ballTouchesLowerSide(ball)){
   ball.reverseYDirection();
  }

  // ball berührt den rechten Paddel
  if (rightPaddle.ballTouchesRight(ball)) {
    ball.reverseXDirection();
  }
  if (rightPaddle.ballTouchesLeft(ball)) {
    ball.reverseXDirection();
  }
  if (rightPaddle.ballTouchesUpper(ball)) {
    ball.reverseYDirection();
  }
  if (rightPaddle.ballTouchesLower(ball)) {
    ball.reverseYDirection();
  }

  // ball berührt den linken Paddel
  if (leftPaddle.ballTouchesLeft(ball)) {
    ball.reverseXDirection();
  }
  if (leftPaddle.ballTouchesRight(ball)) {
    ball.reverseXDirection();
  }
  if (leftPaddle.ballTouchesUpper(ball)) {
    ball.reverseYDirection();
  }
  if (leftPaddle.ballTouchesLower(ball)) {
    ball.reverseYDirection();
  }  

  if (keyPressed == true) {
    if (key == 's') {
      if (leftPaddle.getY() <= max_y - leftPaddle.getSizeY()/2) {
        leftPaddle.moveUp();
      }
    }

    if (key == 'w') {
      if (leftPaddle.getY() >= 0  + leftPaddle.getSizeY()/2) {
        leftPaddle.moveDown();
      }
    }

    if (key == 'k') {
      if (rightPaddle.getY() <= max_y - rightPaddle.getSizeY()/2) {
        rightPaddle.moveUp();
      }
    }
    if (key == 'o') {
      if (rightPaddle.getY() >= 0 + rightPaddle.getSizeY()/2) {
        rightPaddle.moveDown();
      }
    }
  }

  score_right_text = "" + score_right;
  score_left_text = "" + score_left;

  text(score_right_text, 500, 50, 100, 75);
  text(score_left_text, 100, 50, 100, 90);
}

