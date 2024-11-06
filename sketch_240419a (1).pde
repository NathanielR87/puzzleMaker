import Turtle.*;

Turtle t;

void setup() {
  // set-up drawing
  size(1000, 1000);
  background(255);
  stroke(0);
  
  // Create the turtle
  t = new Turtle(this);
  
  // Don't loop the draw function
  noLoop();
}

void draw()
{
  float x_Pos = 100;
  float y_Pos = 100;
  float w_R = 800;
  float h_R = 500;
  
  rect(x_Pos, y_Pos, w_R, h_R);

  float w_P = w_R / 100;
  float h_P = h_R / 100;
  float width_Length = w_R / w_P;
  float height_Length = h_R / h_P;
  
  t.push();

  for(int i = 0; i < h_P; i++) {
    if(i == 0){
      t.right(90);
    }
    else{
      t.penUp();
      t.goToPoint(x_Pos, y_Pos + (height_Length * i));
      t.penDown();
      
      for(int j = 0; j < w_P; j++) {       
        rand_Interlock(width_Length);
      }
    }
  }
  
  t.pop();
  
  t.push();
  
  for(int i = 0; i < w_P; i++) {
    if(i == 0){
      t.right(180);
    }
    else{
      t.penUp();
      t.goToPoint(x_Pos + (width_Length * i), y_Pos);
      t.penDown();
      
      for(int j = 0; j < h_P; j++) {   
        rand_Interlock(height_Length);
      }
    }
  }
    
  t.pop();
}

void rand_Interlock(float len) {
   int num = int(random(2)) + 1;
   
   if (num == 1) {
        t.forward(len * 0.4);
        t.right(90);
        t.forward(len * 0.2);
        t.left(90);
        t.forward(len * 0.2);
        t.left(90);
        t.forward(len * 0.2);
        t.right(90);
        t.forward(len * 0.4);
   }
   else {
        t.forward(len * 0.4);
        t.left(90);
        t.forward(len * 0.2);
        t.right(90);
        t.forward(len * 0.2);
        t.right(90);
        t.forward(len * 0.2);
        t.left(90);
        t.forward(len * 0.4);
   }
}
