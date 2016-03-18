float myX = 150;
float myY = 225;
float myDeltaX;
float myDeltaY;
float ballWidth = 25;

Billiards[] billiards = new Billiards[1];

void setup()
{
  size (850, 450);
  background(0);
  fill(#29B748);
  rect(0, 0, 599, 599);
}

void draw()
{ 
  background(0);
  text("DeltaX: " + myDeltaX + "  Delta Y: " + myDeltaY, 20, 20);
  fill(#29B748);
  rect(25, 25, 799, 399);
  poolCueLines();
  drawCue();
  moveCue();
  cueBounce();
}

void poolCueLines(){
  if (mousePressed)
  {
    stroke(#FFFFFF);
    line(myX, myY, mouseX, mouseY);
  }
}

void mouseReleased()
{
  myDeltaX = (myX - mouseX)/50;
  myDeltaY = (myY - mouseY)/50;
}

void drawCue(){
  noStroke();
  fill(0);
  fill(#FFFFFF);
  stroke(#A6A7A6);
  ellipse(myX, myY, ballWidth, ballWidth);
  noFill();
  translate(myX, myY); 
}

void moveCue(){
   myX += myDeltaX;
   myY += myDeltaY;
}

void cueBounce(){
  if (myX > width-25-ballWidth/2 || myX < 25 + ballWidth/ 2) {
    myDeltaX = -myDeltaX;
    myDeltaX = myDeltaX * 0.6;
    if (myX < 25+ ballWidth/2) {
      myX = 26 + ballWidth/2;
    } else {
      myX = width-26-ballWidth/2;
    }
  }

  if (myY > height-25-ballWidth/2 || myY < 25 + ballWidth/ 2) {
    myDeltaY = -myDeltaY;
    myDeltaY = myDeltaY * 0.6;
    if (myY < 25+ ballWidth/2) {
      myY = 26 + ballWidth/2;
    } else {
      myY = height-26-ballWidth/2;
    }
  }
}

class Billiards
{
  float ballXpos;
  float ballYpos;
  
  Billiards(float tempXpos, float tempYpos, float deltaXbill, float deltaYbill, boolean stripe, String stripeColor) {
    ballXpos = tempXpos;
    ballYpos = tempYpos;
  }
}