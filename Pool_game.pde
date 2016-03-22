float cueX = 150;
float cueY = 225;
float cueDeltaX;
float cueDeltaY;
float ballWidth = 25;

Billiards[] billiards = new Billiards[1];

void setup()
{
  size (850, 450);
  background(0);
  fill(#29B748);
  rect(0, 0, 599, 599);
  billiards[0] = new Billiards(600, 225, 0, 0, false, "");
}

void draw()
{ 
  background(0);
  fill(#FFFFFF);
  stroke(#A6A7A6);
  text("DeltaX: " + cueDeltaX + "  Delta Y: " + cueDeltaY, 20, 20);
  fill(#29B748);
  rect(25, 25, 799, 399);
  poolCueLines();
  drawCue();
  moveCue();
  cueBounce();
  cueFriction();

  drawBilliards();
  billiards[0].collision();
  billiards[0].moveBall();
  billiards[0].billiardBounce();
  billiards[0].billiardFriction();
}

void poolCueLines() {
  if (mousePressed)
  {
    stroke(#FFFFFF);
    line(cueX, cueY, mouseX, mouseY);
  }
}

void mouseReleased()
{
  cueDeltaX = (cueX - mouseX)/50;
  cueDeltaY = (cueY - mouseY)/50;
}

void drawCue() {
  noStroke();
  fill(0);
  fill(#FFFFFF);
  stroke(#A6A7A6);
  ellipse(cueX, cueY, ballWidth, ballWidth);
  noFill();
}

void moveCue() {
  cueX += cueDeltaX;
  cueY += cueDeltaY;
}

void cueBounce() {
  if (cueX > width-25-ballWidth/2 || cueX < 25 + ballWidth/ 2) {
    cueDeltaX = -cueDeltaX;
    cueDeltaX = cueDeltaX * 0.6;
    if (cueX < 25+ ballWidth/2) {
      cueX = 26 + ballWidth/2;
    } else {
      cueX = width-26-ballWidth/2;
    }
  }

  if (cueY > height-25-ballWidth/2 || cueY < 25 + ballWidth/ 2) {
    cueDeltaY = -cueDeltaY;
    cueDeltaY = cueDeltaY * 0.6;
    if (cueY < 25+ ballWidth/2) {
      cueY = 26 + ballWidth/2;
    } else {
      cueY = height-26-ballWidth/2;
    }
  }
}

void drawBilliards() {

  //Yellow Ball 1
  fill(#ffff00);
  stroke(#A6A7A6);
  ellipse(billiards[0].ballXpos, billiards[0].ballYpos, ballWidth, ballWidth);
}

void cueFriction() {
  cueDeltaX = cueDeltaX * 0.995;
  cueDeltaY = cueDeltaY * 0.995;
}

class Billiards
{
  float ballXpos;
  float ballYpos;
  float deltaXball;
  float deltaYball;

  Billiards(float tempXpos, float tempYpos, float deltaXbill, float deltaYbill, boolean stripe, String stripeColor) {
    ballXpos = tempXpos;
    ballYpos = tempYpos;
    deltaXball = deltaXbill;
    deltaYball = deltaYbill;
  }

  void collision() {
    if (cueX > ballXpos-ballWidth/2) {
      cueDeltaX = -cueDeltaX;
      deltaXball = -cueDeltaX * 0.6;
    }
    
    if (cueX < -ballXpos-ballWidth/2) {
      cueDeltaX = cueDeltaX;
      deltaXball = cueDeltaX * 0.6;
    }
  }

  void moveBall() {
    ballXpos += deltaXball;
    ballYpos += deltaYball;
  }

  void billiardBounce() {
   if (ballXpos > width-25-ballWidth/2 || ballXpos < 25 + ballWidth/ 2) {
     deltaXball = -deltaXball;
     deltaXball = deltaXball * 0.6;
     if (ballXpos < 25+ ballWidth/2) {
       ballXpos = 26 + ballWidth/2;
     } else {
       ballXpos = width-26-ballWidth/2;
     }
   }

   if (ballYpos > height-25-ballWidth/2 || ballYpos < 25 + ballWidth/ 2) {
     deltaYball = -deltaYball;
     deltaYball = deltaYball * 0.6;
     if (ballYpos < 25+ ballWidth/2) {
       ballYpos = 26 + ballWidth/2;
     } else {
       ballYpos = height-26-ballWidth/2;
     }
   }
  }
  
  void billiardFriction(){
    deltaXball = deltaXball * 0.995;
    deltaYball = deltaYball * 0.995;
  }
}