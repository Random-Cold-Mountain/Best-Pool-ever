float x = 150;
float y = 225;
float deltaX;
float deltaY;
float arcStart = -PI/2;
float arcEnd = PI/2;
float ballWidth = 25;

BilliardBalls[] billiards = new BilliardBalls[15];

void setup()
{
 size (850, 450);
 background(0);
 fill(#29B748);
 rect(0,0,599,599);
}

void draw()
{ 
 background(0);
 text("DeltaX: " + deltaX + "  Delta Y: " + deltaY, 20, 20);
 fill(#29B748);
 rect(25,25,799,399);
 clubLine(); 
 drawFigure();
 moveFigure();
 bounce();
 friction(); 
}

void clubLine()
{
 if(mousePressed)
 {
    stroke(#FFFFFF);
    line(x,y,mouseX, mouseY);
 }
}

void mouseReleased()
{
 deltaX = (x - mouseX)/50;
 deltaY = (y - mouseY)/50;
}

void drawFigure()
{
 billiards[1] = new BilliardBalls(600, 225, 0, 0);
 fill(#ff0000);
 stroke(#A6A7A6);
 ellipse(billiards[1].xpos, billiards[1].ypos, ballWidth,ballWidth);
 
 noStroke();
 fill(0);
 fill(#FFFFFF);
 stroke(#A6A7A6);
 ellipse(x,y,ballWidth,ballWidth);
 noFill();
 translate(x,y);

}

void moveFigure()
{
 if (deltaX < 0.05 && deltaX > -0.05){
   deltaX = 0;
   deltaY = 0;
 }else{
    x += deltaX; 
 }
 
 if (deltaY < 0.05 && deltaY > -0.05){
   deltaX = 0;
   deltaY = 0;
 }else{
   y += deltaY;
 }
}

void bounce()
{
  if (x > width-25-ballWidth/2 || x < 25 + ballWidth/ 2){
     deltaX = -deltaX;
     deltaX = deltaX * 0.6;
     if (x < 25+ ballWidth/2){
      x = 26 + ballWidth/2; 
     }else{
       x = width-26-ballWidth/2;
     }
  }
  
  if (y > height-25-ballWidth/2 || y < 25 + ballWidth/ 2){
     deltaY = -deltaY;
     deltaY = deltaY * 0.6;
     if (y < 25+ ballWidth/2){
      y = 26 + ballWidth/2; 
     }else{
       y = height-26-ballWidth/2;
     }
  }
}

void friction(){
  deltaX = deltaX * 0.995;
  deltaY = deltaY * 0.995;
}

class BilliardBalls{
  
  float xpos;
  float ypos;
  
  BilliardBalls(float tempXpos, float tempYpos, float deltaXbill, float deltaYbill){
    xpos = tempXpos;
    ypos = tempYpos;
  }
  
  void display(){
    fill(#ff0000);
    stroke(#A6A7A6);
    ellipse(xpos, ypos, ballWidth,ballWidth);
  }
}