/* Bosio Nazareno
   Legajo 88885/6 */

// Initializing variables
PImage fondo;
PFont creditsFont;
int currentScene;
int screenY = 800;
int screenX = 600;
int fontSize = 32;
int opacity = 0;
boolean isFading = false;
String currentCredit = "   Directed by \nGEORGE LUCAS";
int counter = 0;
int x = 0;
int finishedCredits = 1100;

void setup() {
  // Initializing program, setting size and loading assets
  size(800, 600);
  background(0);
  fondo = loadImage("background.jpg");
  creditsFont = createFont("creditsFont.otf", fontSize);
  textFont(creditsFont);
  currentScene = 0;
}

void draw(){
  // Draws the image and stablishes the text color
  image(fondo, 0, 0);
  fill(88, 218, 254);

  // Checks the current scene, and draws accordingly
  if (currentScene == 0) {
      text("STAR WARS EPISODE IV - Haga click para empezar", screenX / 6, 300);
    } else if (currentScene == 1) {
      // Draws the text
      fill(88, 218, 254, opacity);
      text(currentCredit, screenX / 2, screenY / 3);
      
      // Manages the opacity of the text
      if (isFading) {
        opacity -= 5;
      } else {
        opacity += 5;
      }
      
      // Manages the displayed text using a counter
      if (counter == 1) {
        currentCredit = "   Written by \nGEORGE LUCAS";
      } else if (counter == 2) {
        currentCredit = "Executive Producer \n  GEORGE LUCAS";
      } else if (counter == 3) {
        currentCredit = "    Music by \nJOHN WILLIAMS";
      } else if (counter == 4) {
        currentCredit = "Cinematography by \n  GILBERT TAYLOR";
      } else if (counter == 5) {
        currentCredit = "Production Design by \n      JOHN BARRY";
      } else if (counter == 6) {
        currentScene = 2;
      }
      
      // Checks for the opacity and adds one to the counter
      if (opacity == 300) {
        isFading = true;
      } else if (opacity == 0) {
        isFading = false;
        counter += 1;
      }
      
      
    } else if (currentScene == 2) {
      // Changes the text size
      textSize(22);
      // Adds 1 to x so the credits will rise
      x += 1;
      // Substracts 1 of finishedCredits
      finishedCredits -= 1;
      
      // Creates all the text of this scene
      text("CAST", 375, 600 - x);
      textSize(fontSize);
      text("Luke Skywalker    Mark Hamill", screenX / 3, 700 - x);
      text("Han Solo             Harrison Ford", screenX / 3, 750 - x);
      text("Princess Leia       Carrie Fisher", screenX / 3, 800 - x);
      text("Moff Tarkin          Peter Cushing", screenX / 3, 850 - x);
      text("Obi-Wan Kenobi   Alec Guinness", screenX / 3, 900 - x);
      text("C-3PO                 Anthony Daniels", screenX / 3, 950 - x);
      text("R2D2                  Kenny Baker", screenX / 3, 1000 - x);
      text("Chewbacca          Peter Mayhew", screenX / 3, 1050 - x);
      text("Darth Vader         David Prowse", screenX / 3, 1100 - x);
      
      // Checks that the last credit is above the screen, and then restarts the program and each of the counters
      if (finishedCredits == 0) {
        currentScene = 0;
        counter = 0;
        finishedCredits = 1100;
        x = 0;
      }
    }
  
}

void mouseClicked() {
  if (currentScene == 0) {
    currentScene = 1;
  }
}
