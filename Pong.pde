// testing git again
int screen_x = 600;
int screen_y = 600;
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

PongBall ball;
PongPaddle leftPaddle;
PongPaddle rightPaddle;

void setup() {
  size(screen_x, screen_y);
  background(255);
  frameRate(25);
  float paddleSizeX = 200;
  float paddleSizeY = 500;
  font = loadFont("AmericanTypewriter-Light-48.vlw");
  textFont(font);
  ball = new PongBall(max_x/2, max_y/2, ballSize);
  leftPaddle = new PongPaddle(paddleSizeX/2 +2, paddleSizeY/2 +2, paddleSizeX, paddleSizeY);
  rightPaddle = new PongPaddle(max_x - paddleSizeX/2 -2, max_y - paddleSizeY/2 -2, paddleSizeX, paddleSizeY);
}


void draw() {
  background(255);
  rectMode(CENTER);
  shapeMode(CENTER);
  fill(225, 240, 140, 128);

  ball.draw();
  leftPaddle.draw();
  rightPaddle.draw();


  // ball berührt rechten oder linken rand
  if (ball.getX() > max_x - ballSize/2 ) {
    score_left += 1;
    ball.setXDirection(-1);
  } 
  else if (ball.getX() < 0 + ballSize/2) {
    score_right += 1;
    ball.setXDirection(1);
  }

  // ball berührt oberen oder unteren Rand
  if (ball.getY() > max_y - ballSize/2 ) {
    ball.setYDirection(-1);
  } 
  else if (ball.getY() < 0 + ballSize/2) {
    ball.setYDirection(1);
  } 

  // ball berührt den rechten Paddel
  if  (ball.getX() + ballSize/2 >= rightPaddle.getX() - rightPaddle.getSizeX()/2
    && ball.getY() + ballSize/2 <= rightPaddle.getY() + rightPaddle.getSizeY()/2 
    && ball.getY() - ballSize/2 >= rightPaddle.getY() - rightPaddle.getSizeY()/2 /*- balleffet*/ ) {
    ball.setXDirection(-1);
    // balleffet = dist(ballX, ballY, positionXRight, positionYRight)/2;
  }

  //ball berührt den linken Paddel
  //linker Ballrand kleiner als rechte Seite von linkem Paddel
  if  (ball.getX() - ballSize/2 <= leftPaddle.getX() + leftPaddle.getSizeX()/2
  //Unterkante Ball ist kleiner als Oberkante linkes Paddel
    && ball.getY() - ballSize/2 <= leftPaddle.getY() + leftPaddle.getSizeY()/2 
  //Oberkante Ball ist größer als 
    && ball.getY() + ballSize/2 >= leftPaddle.getY() - leftPaddle.getSizeY()/2 /* + balleffet */ ) {
    ball.setXDirection(1);

    // balleffet = dist(ballX, ballY, positionX, positionY)/2;
    // balleffet = speedX;
  }

  //ballX = ballX + speedX;

  if (keyPressed == true) {
    if (key == 's') {
      if(leftPaddle.getY() <= max_y - leftPaddle.getSizeY()/2){
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

