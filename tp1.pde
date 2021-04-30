/* TP 1
  Nazareno Bosio
  88885/6
*/

// Initializing the program
void setup(){
  
  // Stablishing size of the window and a background colour
  size(600,500);
  background(255);
  
  
  // Adding decorative lines
  stroke(125);
  noFill();
  triangle(225, 300, 300, 150, 375, 300);
  line(225, 200, 375, 300);
  line(375, 200, 225, 300);
  line(300, 150, 300, 350);
  stroke(0);
  
  // DRAWING BACKGROUND COLOURS
  
  // Drawing and colorizing fuxia triangle
  fill(255,0,159);
  triangle(200, 75, 300, 125, 200, 175);
  
  // Drawing and colorizing orange triangle
  fill(255,159,0);
  triangle(300, 125, 400, 75, 400, 175);
  
  // Drawing and colorizing violet triangle
  fill(159,0,255);
  triangle(200, 200, 100, 250, 200, 300);
  
  // Drawing and coloring lime triangle
  fill(159, 255, 0);
  triangle(400, 200, 400, 300, 500, 250);
  
  // Drawing and coloring azure triangle
  fill(0, 159, 255);
  triangle(200, 325, 300, 375, 200, 425);
  
  // Drawing and coloring cyan green triangle
  fill(159, 255, 0);
  triangle(300, 375, 400, 325, 400, 425);
  
  // DRAWING FRONT COLOURS
  
  // Drawing and colorizing red triangle
  fill(255,0,0);
  triangle(250, 150, 300, 50, 350, 150);
  
  // Drawing and colorizing magenta triangle
  fill(255,0,255);
  triangle(150, 150, 200, 250, 250, 150);
  
  // Drawing and colorizing yellow triangle
  fill(255, 255, 0);
  triangle(350, 150, 450, 150, 400, 250);
  
  // Drawing and colorizing blue triangle
  fill(0,0,255);
  triangle(200, 250, 150, 350, 250, 350);
  
  // Drawing and colorizing green triangle
  fill(0,255,0);
  triangle(350, 350, 400, 250, 450, 350);
  
  // Drawing and colorizing cyan triangle
  fill(0,255,255);
  triangle(250, 350, 300, 450, 350, 350);
}
