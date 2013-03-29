// testing git again
int screen_x = 600;
int screen_y = 600;
int max_x = screen_x -1;
int max_y = screen_y -1;
float ballSize = 20;
float widthBat = 20;
float heightBat = 80;
String direction = "rechts";
float positionXLeft= widthBat/2 +2;
float positionYLeft= heightBat/2 +2;
String directionR = "up";
float positionXRight = max_x - widthBat/2 -2;
float positionYRight = max_y - heightBat/2 -2;
float rightScore = 0;
float leftScore = 1;
int score_right = 0;
int score_left = 0;
int score_a = 0;
String score_right_text;
String score_left_text;
PFont font;

PongBall ball;

void setup() {
  size(screen_x, screen_y);
  background(255);
  frameRate(25);
  font = loadFont("AmericanTypewriter-Light-48.vlw");
  textFont(font);
  ball = new PongBall(max_x/2, max_y/2, ballSize);
}


void draw() {
  background(255);
  rectMode(CENTER);
  shapeMode(CENTER);
  fill(225, 240, 140, 128);

  ball.draw();

  rect(positionXLeft, positionYLeft, widthBat, heightBat);
  rectMode(CENTER);
  rect(positionXRight, positionYRight, widthBat, heightBat);


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
  if (ball.getX() + ballSize/2 >= positionXRight - widthBat/2
    && ball.getY() + ballSize/2 <= positionYRight + heightBat/2 
    && ball.getY() - ballSize/2 >= positionYRight - heightBat/2 /*- balleffet*/ ) {
    ball.setXDirection(-1);
    // balleffet = dist(ballX, ballY, positionXRight, positionYRight)/2;
  }

  //ball berührt den linken Paddel
  if (ball.getX() - ballSize/2 <= positionXLeft+ widthBat/2
    && ball.getY() + ballSize/2 <= positionYLeft+ heightBat/2 
    && ball.getY() - ballSize/2 >= positionYLeft- heightBat/2 /* + balleffet */ ) {
    ball.setYDirection(1);

    // balleffet = dist(ballX, ballY, positionX, positionY)/2;
    // balleffet = speedX;
  }

  //ballX = ballX + speedX;

  if (keyPressed == true) {
    if (key == 'w') {
      positionYLeft+= 10;
      if (positionYLeft>= max_x) {
        positionYLeft= max_x - 80;
      }
    }

    if (key == 's') {
      positionYLeft-= 10;
      if (positionYLeft<= 0) {
        positionYLeft= 0 + 80;
      }
    }

    if (key == 'o') {
      positionYRight += 10;
      if (positionYRight >= max_x) {
        positionYRight = max_x - 80;
      }
    }
    if (key == 'k') {
      positionYRight -= 10;
      if (positionYRight <= 0) {
        positionYRight = 0 + 80;
      }
    }
  }

  score_right_text = "" + score_right;
  score_left_text = "" + score_left;

  text(score_right_text, 500, 50, 100, 75);
  text(score_left_text, 100, 50, 100, 90);
}

