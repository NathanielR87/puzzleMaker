////This is an arc pattern 




void setup() {
  size(1000, 800);
  frameRate(120);
  noLoop();
}

void draw() {
  // Drawing the boundary rectangle
  rect(100, 100, 800, 600);
  
  int cols = 10; // Number of arcs horizontally
  int rows = 9; // Number of arcs vertically

  // Calculate the width and height of the space for each arc
  float arcWidth = 800 / float(cols);
  float arcHeight = 600 / float(rows);

  // Loop through each row
  for (int i = 0; i < rows; i++) {
    // Loop through each column
    for (int j = 0; j < cols; j++) {
      // Calculate the x and y position for the arc
      // Adjustments are made so the arc is drawn at the corners
      float x = 100 + j * arcWidth + arcWidth / 2;
      float y = 100 + i * arcHeight + arcHeight / 2;

      // Draw the arcs to form a grid-like pattern
      // Top-right corner
      arc(x, y, arcWidth, arcHeight, 0, HALF_PI);
      // Bottom-left corner
      arc(x, y, arcWidth, arcHeight, PI, PI + HALF_PI);
      // Top-left corner
      arc(x, y, arcWidth, arcHeight, HALF_PI, PI);
      // Bottom-right corner
      arc(x, y, arcWidth, arcHeight, PI + HALF_PI, TWO_PI);
    }
  }
}
