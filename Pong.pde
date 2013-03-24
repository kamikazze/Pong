int screen_x = 600;
int screen_y = 600;
int max_x = screen_x -1;
int max_y = screen_y -1;
float ballX = max_x/2;
float ballY = max_y/2;
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
float speedDeltaX = 10;
float speedDeltaY = 10;
float speedX = speedDeltaX;
float speedY = speedDeltaY;
float balleffet = 1;
int score_right = 0;
int score_left = 0;
int score_a = 0;
String score_right_text;
String score_left_text;
float kick;
PFont font;
int xDirection = 1;
int yDirection = 1;


void setup() {
  size(screen_x, screen_y);
  background(255);
  frameRate(25);
  font = loadFont("AmericanTypewriter-Light-48.vlw");
  textFont(font);
}


void draw() {
  background(255);
  rectMode(CENTER);
  shapeMode(CENTER);
  fill(225, 240, 140, 128);
  ellipse(ballX, ballY, ballSize, ballSize);
  rect(positionXLeft, positionYLeft, widthBat, heightBat);
  rectMode(CENTER);
  rect(positionXRight, positionYRight, widthBat, heightBat);

  // ball berührt rechten oder linken rand
  if (ballX > max_x - ballSize/2 ) {
    score_left += 1;
    speedX = speedDeltaX;
    xDirection = -1;
  } else if (ballX < 0 + ballSize/2) {
    score_right += 1;
    speedX = speedDeltaX;
    xDirection = 1;
  }


  // ball berührt oberen oder unteren Rand
  if (ballY > max_y - ballSize/2 ) {
    speedY = speedDeltaY;
    yDirection = -1;
  } else if (ballY < 0 + ballSize/2) {
    speedY = speedDeltaY;
    yDirection = 1;
  }  
  
  

  // ball berührt den rechten Paddel
  if (ballX + ballSize/2 >= positionXRight - widthBat/2
    && ballY + ballSize/2 <= positionYRight + heightBat/2 
    && ballY - ballSize/2 >= positionYRight - heightBat/2 /*- balleffet*/ ) {
        xDirection = -1;
        speedX = speedDeltaX;
        // balleffet = dist(ballX, ballY, positionXRight, positionYRight)/2;
  }

  //ball berührt den linken Paddel
  if (ballX - ballSize/2 <= positionXLeft+ widthBat/2
    && ballY + ballSize/2 <= positionYLeft+ heightBat/2 
    && ballY - ballSize/2 >= positionYLeft- heightBat/2 /* + balleffet */ ) {
    xDirection = 1;
    speedX = speedDeltaX;

    // balleffet = dist(ballX, ballY, positionX, positionY)/2;
    // balleffet = speedX;
  }

  //ballX = ballX + speedX;
  ballX = ballX + speedX * xDirection * balleffet/2;
  ballY = ballY + speedY * yDirection * balleffet/2;

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
