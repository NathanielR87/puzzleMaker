import processing.svg.*;

PImage img;

import Turtle.*;

Turtle t;

void setup() {
  // set-up drawing
  size(1000, 1000);
  background(255);
  stroke(0);
  img = loadImage("NewElGato.png");
  
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
      t.goToPoint(x_Pos, y_Pos + (width_Length * i));
      t.penDown();
      
      for(int j = 0; j < w_P; j++) {       
        t.forward(width_Length * .4);
        t.right(90);
        t.forward(width_Length * .2);
        t.left(90);
        t.forward(width_Length * .2);
        t.left(90);
        t.forward(width_Length * .2);
        t.right(90);
        t.forward(width_Length * .4);
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
      t.goToPoint(x_Pos + (height_Length * i), y_Pos);
      t.penDown();
      
      for(int j = 0; j < h_P; j++) {       
        t.forward(height_Length * .4);
        t.right(90);
        t.forward(height_Length  * .2);
        t.left(90);
        t.forward(height_Length  * .2);
        t.left(90);
        t.forward(height_Length  * .2);
        t.right(90);
        t.forward(height_Length  * .4);
      }
      
    }
  }
    
  t.pop();
  //circle(400, 300, 100);
  //image(img, 100, 200, 150, 150);
  //image(img, 200, 400, 150, 150);
  
  // Place and rotate images randomly
  ArrayList<PVector> placedImages = new ArrayList<PVector>();  // List to store the positions of placed images
  int imageWidth = 150;
  int imageHeight = 150;
  int numImages = 10;  // Number of images to place

  while (placedImages.size() < numImages) {
    float randomX = random(x_Pos, x_Pos + w_R - imageWidth);
    float randomY = random(y_Pos, y_Pos + h_R - imageHeight);
    PVector newPos = new PVector(randomX, randomY);

    boolean overlaps = false;
    for (PVector pos : placedImages) {
      if (newPos.dist(pos) < imageWidth) {  // Check if positions are too close
        overlaps = true;
        break;
      }
    }

    if (!overlaps) {
      placedImages.add(newPos);
      float randomAngle = random(TWO_PI);

      pushMatrix();
      translate(randomX + imageWidth / 2, randomY + imageHeight / 2);
      rotate(randomAngle);
      image(img, -imageWidth / 2, -imageHeight / 2, imageWidth, imageHeight);
      popMatrix();
    }
  }
}
