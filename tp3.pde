/* Nazareno Carlos Bosio

   Legajo: 88885/6 
   
   Video: https://www.youtube.com/watch?v=i--zTXPCxrI */

// Initializing variables

boolean invertedColors;
int objectsDrawn;
float angle;
int currentScene;


void setup() {
  // Setting the window and draw mode
  size(1000, 1000);
  noStroke();

}

void draw() {
  
  // Checks the current scene
  
  if (currentScene == 0) {
    
    // Draws the first scene and resets each variable
    translate(0, 0);
    invertedColors = false;
    objectsDrawn = 50;
    angle = 0;
    background(0);
    fill(255);
    textSize(32);
    text("Para comenzar la ilusión, haga click izquierdo.\nPara salir de la ilusión, haga click derecho.", width/6, height/2);
    
  
  } else if(currentScene == 1) {
  
    // Setting the variable rectSize to 50
    int rectSize = 50;
    
    background(0);
    
    // Sets the velocity of the rotation based on the mouse's X position from the left of the window
    
    float vel = map(mouseX, 0, width, 0, 36);
    angle += vel;
    
    // When the angle equals 360, sets it to zero so the number stops from being to big
    
    if (angle == 360) {
      angle = 0;
    
    }
    
    // Sets the center of the rotation to the center of the screen
    translate(width/2, height/2);
    rectMode(CENTER);
    
    // Transforms the angle to radians and then rotates accordingly
    rotate(radians(angle));
    
    // Draws each rectangle and assigns a color
    
    for (int i = 0; i < objectsDrawn; i++) {
      
      int currentDistance = (50 * i);
          
      if (i % 2 == 0) {
        
        if(invertedColors == true) {
          fill(0);
        } else {
          fill(255);
        }
      
      } else {
        if(invertedColors == true) {
          fill(255);
        } else {
          fill(0);
        }
      }
      
      rect(currentDistance, currentDistance, rectSize, rectSize);
      rect(-currentDistance, currentDistance, rectSize, rectSize);
      rect(currentDistance, -currentDistance, rectSize, rectSize);
      rect(-currentDistance, -currentDistance, rectSize, rectSize);
      
      
      // Adds to the size of the rectangles 
      rectSize += 20;
      
    }
    
  }
}

// Checks for a mouse click to change scenes or colors.
void mouseClicked() {
  
  if(mouseButton == RIGHT && currentScene == 1){
    currentScene = 0;
  } else if(mouseButton == LEFT && currentScene == 0) {
    currentScene = 1;
  } else if (mouseButton == LEFT && currentScene ==1) {
    if (invertedColors == false) { 
      invertedColors = true;
    } else { 
      invertedColors = false;
    }
  }
}
