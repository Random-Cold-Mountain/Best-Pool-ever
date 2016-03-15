float x = 150;
float y = 200;
float deltaX;
float deltaY;
float arcStart = -PI/2;
float arcEnd = PI/2;
float ballWidth = 25;


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
 deltaX = (x - mouseX)/66;
 deltaY = (y - mouseY)/66;
}

void drawFigure()
{
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
 x += deltaX;
 y += deltaY;
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