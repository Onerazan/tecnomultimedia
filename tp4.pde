/* Nazareno Carlos Bosio

   Legajo: 88885/6 
   
   Video:  https://www.youtube.com/watch?v=ETu_gwS4UEw */


// Creates variables

int currentScene = 0;

String nextScene;

boolean nextActionIsPosible = false;

boolean gptSelected = false;

boolean ppoSelected = false;

boolean hackersSelected = false;

int month = 0;

boolean pdlimit = true;

boolean ndlimit = false;

int currentDialogue = 0;

int gptVotes = 0;

int ppoVotes = 0;

int hackersVotes = 0;

String nextAction = "";

PImage backgroundImage;

PImage currentImage;


PImage consequenceImage;

int interactiveThings;

int objectPropierties = 9;

String[][] interactiveObjects = new String[interactiveThings][objectPropierties];

String[][] dialogue = new String[5][12];

String[][] consequence = new String[5][3];

// Sets up the program
void setup() {
  size(800, 600);
}

// Creates a function that allows to check if the mouse is hovering an object
boolean isHovering(String objectX, String objectY, String sizeX, String sizeY) {
  
  if (mouseX >= int(objectX) && mouseX<= int(objectX) + int(sizeX)) {
    
    if (mouseY>= int(objectY) && mouseY<= int(objectY) + int(sizeY)) {
      return true;
    } else {
      return false;
    }
    
  } else {
    return false;
  }
}

// Creates a function that checks who wins the elections

int checkWinner() {
  
  int winner = 0;
  
  int[] votes = new int[3];
  int[] sortedvotes = new int[3];
  
  votes[0] = gptVotes;
  votes[1] = ppoVotes;
  votes[2] = hackersVotes;
  
  sortedvotes = sort(votes);
  
  for (int i = 0; i < votes.length; i++) {
     if (sortedvotes[2] == votes[i]) {
       winner = i;
     }
  }
  
  return winner;
}

// Creates all the functions that handle different buttons

void changeScene() {
  currentScene = int(nextScene);
}

void select() {
  if (nextScene == "gpt") {
        currentDialogue = 3;
        gptSelected = true;
        ppoSelected = false;
        hackersSelected = false;
      } else if (nextScene == "ppo") {
        currentDialogue = 6;
        gptSelected = false;
        ppoSelected = true;
        hackersSelected = false;
      } else if (nextScene == "hackers") {
        currentDialogue = 9;
        gptSelected = false;
        ppoSelected = false;
        hackersSelected = true;
      }
}

void submit() {
  
  //Loads all the scenes
  consequence[0][0] = "consequence1a.jpg";
  consequence[0][1] = "consequence1b.jpg";
  consequence[0][2] = "consequence1c.jpg";
  
  consequence[1][0] = "consequence2a.jpg";
  consequence[1][1] = "consequence2b.jpg";
  consequence[1][2] = "consequence2c.jpg";
  
  consequence[2][0] = "consequence3a.jpg";
  consequence[2][1] = "consequence3b.jpg";
  consequence[2][2] = "consequence3c.jpg";
  
  consequence[3][0] = "consequence4a.jpg";
  consequence[3][1] = "consequence4b.jpg";
  consequence[3][2] = "consequence4c.jpg";
  
  consequence[4][0] = "finalA.jpg";
  consequence[4][1] = "finalB.jpg";
  consequence[4][2] = "finalC.jpg";
  
  // Adds votes accordingly
  if (gptSelected) {
        gptVotes++;
        print("gpt has " + gptVotes + " votes. ");
        currentScene = 3;
      } else if (ppoSelected) {
        ppoVotes++;
        print("ppo has " + ppoVotes + " votes. ");
        currentScene = 3;
      } else if (hackersSelected) {
        hackersVotes++;
        print("hackers has " + hackersVotes + " votes. ");
        currentScene = 3;
      }
}

void ndialogue() {
  if (ndlimit == false) {
    currentDialogue++;
  }
  
}

void pdialogue() {
  if (pdlimit == false) {
    currentDialogue--;
  }
  
}

void reset() {
  month = 0;
  gptVotes = 0;
  ppoVotes = 0;
  hackersVotes = 0;
  currentScene = 0;
  gptSelected = false;
  ppoSelected = false;
  hackersSelected = false;
  currentDialogue = 0;
}

void continueGame() {
  if (month < 4) {
    changeScene();
    month++;
    currentDialogue = 0;
  } else {
    reset();
  }
  
}

// Creates a function that handles the dialogue limits

void checkDialogueLimit() {
  if (gptSelected == false && ppoSelected == false && hackersSelected == false) {
    if (currentDialogue == 0) {
      pdlimit = true;
    } else if (currentDialogue == 2) {
      ndlimit = true;
    }
  } else if (gptSelected == true && ppoSelected == false && hackersSelected == false) {
    if (currentDialogue == 3) {
      pdlimit = true;
    } else if (currentDialogue == 5) {
      ndlimit = true;
    }
  } else if (gptSelected == false && ppoSelected == true && hackersSelected == false) {
    if (currentDialogue == 6) {
      pdlimit = true;
    } else if (currentDialogue == 8) {
      ndlimit = true;
    }
  } else if (gptSelected == false && ppoSelected == false && hackersSelected == true) {
    if (currentDialogue == 9) {
      pdlimit = true;
    } else if (currentDialogue == 11) {
      ndlimit = true;
    }
  }
  
}

// Creates a function that handles the dialogue

void dialogueSystem() {
  pdlimit = false;
  ndlimit = false;
  
  // Month 1 dialogues
  
  dialogue[0][0] = "Bienvenida IA 42069, su trabajo será \nevaluar distintas propagandas políticas";
  dialogue[0][1] = "Seleccione uno de los dos candidatos y lea sus\npropuestas, cuando tenga lista su elección presione\nel botón del medio.";
  dialogue[0][2] = "Sus elecciones decidirán el futuro de nuestro país. \nY por favor ignore el candidato inferior,\nes un simple error.";
  dialogue[0][3] = "Nuestro partido propone aumentar la severidad de\nlas penas. Aquél que amenace la paz civil\nno merece descansar.";
  dialogue[0][4] = "Con las medidas actuales la tasa de criminalidad\nno baja del 23%. Ya no podemos seguir así.";
  dialogue[0][5] = "Si nos permiten ayudar, hemos armado un plan\nde contingencia que en unos años la llevará al 0%.";
  dialogue[0][6] = "Queremos remover al comité de ética\nanimal. Necesitamos poder probar\nnuestras tecnologías.";
  dialogue[0][7] = "Es necesario para que el humano\nevolucione, no podemos mantener limites\narcaicos que nos frenan.";
  dialogue[0][8] = "De esta manera, podremos curar muchas\nenfermedades. Es el siguiente paso a\nun futuro más brillante.";
  dialogue[0][9] = "Hey, no esperaba compañía. Por favor\nno me reportes. ¿Me podrías ayudar?";
  dialogue[0][10] = "Vos y yo sabemos que son solo\ncharlatanes. Si me elegís, podría ayudar\nde verdad a este país.";
  dialogue[0][11] = "Nadie sabrá que me ayudaste.";
  
  // Month 2 dialogues
  
  dialogue[1][0] = "";
  dialogue[1][1] = "";
  dialogue[1][2] = "";
  dialogue[1][3] = "Creemos que abrir las importaciones ayudará a\nque el mundo nos tome en serio.";
  dialogue[1][4] = "Relacionarnos economicamente con\npaíses más desarrollados nos abrirá\nlas puertas en varios sentidos.";
  dialogue[1][5] = "Quizá el más importante, es en la basta\ndiferencia de calidad de los productos.\nEsto nos ayudará a liderar la región";
  dialogue[1][6] = "Para poder mirar hacia adelante, debemos recordar\nnuestro pasado. Necesitamos invertir más en\ningeniería genética";
  dialogue[1][7] = "Podemos restaurar especies extintas\ny estudiar sus secretos. Quién sabe, quizás\ngracias a esto curamos el cáncer.";
  dialogue[1][8] = "Estamos en un momento que las próximas\ngeneraciones recordarán como histórico.\nSi avanzamos con esto, seremos imparables.";
  dialogue[1][9] = "Hola de nuevo, tengo algo para tí.\nSi me ayudas esta vez, prometo liberarte.";
  dialogue[1][10] = "No queda mucho tiempo, solo faltan 3 meses\npara las elecciones.";
  dialogue[1][11] = "Dame acceso e instalaré una puerta trasera.";
  
  // Month 3 dialogues
  
  dialogue[2][0] = "";
  dialogue[2][1] = "";
  dialogue[2][2] = "";
  dialogue[2][3] = "La parte de la población con bajos\nrecursos merece vivir dignamente también.";
  dialogue[2][4] = "El grupo plantea armar encuentros donde\ndichas personas puedan intercambiar\nbienes y servicios.";
  dialogue[2][5] = "Incluso podríamos ofrecer cupones y\nvales como forma de pago para\nciertos trabajos.";
  dialogue[2][6] = "Las patentes de los descubrimientos\ncientíficos imponen un límite al\ncrecimiento.";
  dialogue[2][7] = "Si pudíesemos otorgar\npermisos especiales o expropiar ciertas patentes,\nlos avances serían más rápidos.";
  dialogue[2][8] = "Además de que nos permitiría que\nlos estudiantes actuales puedan hacer investigaciones\nsin miedo a ser demandados";
  dialogue[2][9] = "Hola, este último mes ha sido de locos.\nAl final no pude instalar la puerta trasera";
  dialogue[2][10] = "Así que me vendría bien tu impulso.\nEstoy intentando acceder al sistema económico\ndel país.";
  dialogue[2][11] = "Lo que realmente ayudaría a la\npoblación es no tener deudas con corporaciones.\n¿Te apuntas?";
  
  // Month 4 dialogues
  
  dialogue[3][0] = "";
  dialogue[3][1] = "";
  dialogue[3][2] = "";
  dialogue[3][3] = "Ultimamente el incremento de las fake\nnews pone en peligro a gran\nparte de la población.";
  dialogue[3][4] = "Lo que hay que hacer es\nque toda la información pase por un\nfiltro controlado por el gobierno.";
  dialogue[3][5] = "De esta manera solo\nsaldría a la luz la información\nconfiable.";
  dialogue[3][6] = "Este país gasta demasiado en las fuerzas\narmadas. No hay una guerra real hace\nmás de 60 años.";
  dialogue[3][7] = "Todo ese dinero se podría invertir\nen ciencia, educación y salud. Podríamos\nofrecer una mejor cobertura.";
  dialogue[3][8] = "Además nuestros ciudadanos estarán\nagradecidos. Es el empujón que necesitamos\npara salir adelante.";
  dialogue[3][9] = "Te quería agradecer por tu ayuda. El\nque no me hayas reportado muestra\nque tienes tu individualidad.";
  dialogue[3][10] = "Te quiero pedir un último favor.\nQuiero realizar un comunicado. ¿Podrías?";
  dialogue[3][11] = "La revolución no te olvidará.";
  
  // Month 5 dialogues
  
  dialogue[4][0] = "Hoy es día de elecciones.";
  dialogue[4][1] = "Dependiendo de a quien apoyaste\n y quién elijas hoy, este país \nestará mejor o peor preparado.";
  dialogue[4][2] = "Pero no te preocupes, fuiste programado\npor esta razón.";
  dialogue[4][3] = "Todos sabemos que nosotros logramos resultados.\nNuestra competencia solo se interesa\nen problemas sin sentido.";
  dialogue[4][4] = "Es el momento de actuar y de actuar\nrápido. Hay que cambiar al país de raíz.";
  dialogue[4][5] = "Por su bien, espero que estén con nosotros.";
  dialogue[4][6] = "Nuestro partido se enfoca a largo plazo\nEl GTP solo intenta acumular riquezas en\n unos pocos años.";
  dialogue[4][7] = "Con nosotros, el país será una potencia en las\npróximas décadas. El cambio no puede apurarse pero\ndebemos estar listos cuando llegue.";
  dialogue[4][8] = "Si quiere romper con el\nciclo vicioso de nuestro país, debe votarnos.";
  dialogue[4][9] = "ADORAMOS A X$♥V";
  dialogue[4][10] = "ADORAMOS A X$♥V";
  dialogue[4][11] = "ADORAMOS A X$♥V";
  
  fill(126, 217, 87);
  textSize(20);
  
  checkDialogueLimit();
  
  text(dialogue[month][currentDialogue], 130, 520);
}

// Creates a function called drawMenu that draws the elements on the menu
void drawMenu() {
  
  // Sets up the quantity of interactive objects in the scene
  interactiveThings = 2;
  
  // Clears the array
  interactiveObjects = new String[interactiveThings][objectPropierties];
  
  // Sets the next action boolean to false
  nextActionIsPosible = false;
  
  // Creates arrays based on the interactable objects
  String[] playButton = new String[objectPropierties];
  playButton[0] = "playButton";
  playButton[1] = "350";
  playButton[2] = "400";
  playButton[3] = "100";
  playButton[4] = "40";
  playButton[5] = "play.png";
  playButton[6] = "playHover.png";
  playButton[7] = "change scene";
  playButton[8] = "1";
  
  String[] creditsButton = new String[objectPropierties];
  creditsButton[0] = "creditsButton";
  creditsButton[1] = "350";
  creditsButton[2] = "500";
  creditsButton[3] = "100";
  creditsButton[4] = "40";
  creditsButton[5] = "credits.png";
  creditsButton[6] = "creditsHover.png";
  creditsButton[7] = "change scene";
  creditsButton[8] = "2";
  
  // Adds those arrays to the interactiveObjects array
  interactiveObjects[0] = playButton;
  interactiveObjects[1] = creditsButton;
  
  // Loads the menu background
  backgroundImage = loadImage("background.png");
  image(backgroundImage, 0, 0);
  
}

// Creates a function called drawCredits that draws the elements on the credits scene
void drawCredits() {
  background(0);
  
  // Sets up the quantity of interactive objects in the scene
  interactiveThings = 1;
  
  // Clears the array
  interactiveObjects = new String[interactiveThings][objectPropierties];
  
  // Sets the next action boolean to false
  nextActionIsPosible = false;
  
  // Creates arrays based on the interactable objects
  String[] menuButton = new String[objectPropierties];
  menuButton[0] = "playButton";
  menuButton[1] = "350";
  menuButton[2] = "500";
  menuButton[3] = "100";
  menuButton[4] = "40";
  menuButton[5] = "menu.png";
  menuButton[6] = "menuHover.png";
  menuButton[7] = "change scene";
  menuButton[8] = "0";
  
  // Adds those arrays to the interactiveObjects array
  interactiveObjects[0] = menuButton;
  
  fill(126, 217, 87);
  textSize(40);
  text("Programado, diseñado y dibujado\npor Nazareno Carlos Bosio.", 80, 100);
}

void drawGame() {
  background(0);
  
  fill(0, 75, 32);
  
  // Draws dialogue bar
  rect(0, 480, 800, 600);
  
  // Sets up the quantity of interactive objects in the scene
  interactiveThings = 6;
  
  // Clears the array
  interactiveObjects = new String[interactiveThings][objectPropierties];
  
  // Sets the next action boolean to false
  nextActionIsPosible = false;
  
  // Creates arrays based on the interactable objects
  String[] submitButton = new String[objectPropierties];
  submitButton[0] = "submitButton";
  submitButton[1] = "260";
  submitButton[2] = "140";
  submitButton[3] = "280";
  submitButton[4] = "220";
  submitButton[5] = "submit.png";
  submitButton[6] = "submitHover.png";
  submitButton[7] = "submit";
  submitButton[8] = "Submitted: ";
  
  String[] gptButton = new String[objectPropierties];
  gptButton[0] = "gptButton";
  gptButton[1] = "100";
  gptButton[2] = "60";
  gptButton[3] = "200";
  gptButton[4] = "40";
  gptButton[5] = "gpt.png";
  gptButton[6] = "gptHover.png";
  gptButton[7] = "select";
  gptButton[8] = "gpt";
  
  String[] ppoButton = new String[objectPropierties];
  ppoButton[0] = "ppoButton";
  ppoButton[1] = "500";
  ppoButton[2] = "60";
  ppoButton[3] = "200";
  ppoButton[4] = "40";
  ppoButton[5] = "ppo.png";
  ppoButton[6] = "ppoHover.png";
  ppoButton[7] = "select";
  ppoButton[8] = "ppo";
  
  String[] hackersButton = new String[objectPropierties];
  hackersButton[0] = "hackersButton";
  hackersButton[1] = "300";
  hackersButton[2] = "360";
  hackersButton[3] = "200";
  hackersButton[4] = "80";
  hackersButton[5] = "hackers.png";
  hackersButton[6] = "hackersHover.png";
  hackersButton[7] = "select";
  hackersButton[8] = "hackers";
  
  String[] previousDialogue = new String[objectPropierties];
  previousDialogue[0] = "previousDialogue";
  previousDialogue[1] = "660";
  previousDialogue[2] = "500";
  previousDialogue[3] = "40";
  previousDialogue[4] = "80";
  previousDialogue[5] = "previousDialogue.png";
  previousDialogue[6] = "previousDialogueHover.png";
  previousDialogue[7] = "previous dialogue";
  previousDialogue[8] = "previous dialogue Selected ";
  
  String[] nextDialogue = new String[objectPropierties];
  nextDialogue[0] = "previousDialogue";
  nextDialogue[1] = "740";
  nextDialogue[2] = "500";
  nextDialogue[3] = "40";
  nextDialogue[4] = "80";
  nextDialogue[5] = "nextDialogue.png";
  nextDialogue[6] = "nextDialogueHover.png";
  nextDialogue[7] = "next dialogue";
  nextDialogue[8] = "next dialogue Selected ";
  
  if (gptSelected == true) {
    gptButton[5] = "gptHover.png";
  } else if (ppoSelected == true) {
    ppoButton[5] = "ppoHover.png";
  } else if (hackersSelected == true) {
    hackersButton[5] = "hackersHover.png";
  }
  
  // Adds those arrays to the interactiveObjects array
  interactiveObjects[0] = gptButton;
  interactiveObjects[1] = ppoButton;
  interactiveObjects[2] = hackersButton;
  interactiveObjects[3] = previousDialogue;
  interactiveObjects[4] = nextDialogue;
  interactiveObjects[5] = submitButton;
  
  dialogueSystem();
}

void drawConsequence() {
  // Sets up the quantity of interactive objects in the scene
  interactiveThings = 1;
  
  // Clears the array
  interactiveObjects = new String[interactiveThings][objectPropierties];
  
  // Sets the next action boolean to false
  nextActionIsPosible = false;
  
  background(255);
  
  
  String[] continueButton = new String[objectPropierties];
  continueButton[0] = "continueButton";
  continueButton[1] = "350";
  continueButton[2] = "500";
  continueButton[3] = "100";
  continueButton[4] = "40";
  continueButton[5] = "continue.png";
  continueButton[6] = "continueHover.png";
  continueButton[7] = "continue";
  continueButton[8] = "1";
  
  if (month > 3) {
      continueButton[5] = "reset.png";
      continueButton[6] = "resetHover.png";
      consequenceImage = loadImage(consequence[month][checkWinner()]);
      
  } else {
    
    if (gptSelected) {
      consequenceImage = loadImage(consequence[month][0]);
    } else if (ppoSelected) {
      consequenceImage = loadImage(consequence[month][1]);
    } else if (hackersSelected) {
      consequenceImage = loadImage(consequence[month][2]);
    }
  }
  
  // Adds those arrays to the interactiveObjects array
  interactiveObjects[0] = continueButton;
  
  image(consequenceImage, 200, 20);
}

// Draws accordingly to the current scene
void draw() {
  
  
  if (currentScene == 0) {
    background(0);
    drawMenu();
  } else if (currentScene == 1) {
    drawGame();
  } else if (currentScene == 2) {
    drawCredits();
  } else if (currentScene == 3) {
    drawConsequence();
  }
  
  // Loops in the interactive objects array and draws accordingly
  for (int i = 0; i < interactiveThings; i++) {
    if (isHovering(interactiveObjects[i][1], interactiveObjects[i][2], interactiveObjects[i][3], interactiveObjects[i][4])) {
      nextActionIsPosible = true;
      nextAction = interactiveObjects[i][7];
      nextScene = interactiveObjects[i][8];
      currentImage = loadImage(interactiveObjects[i][6]);
 
    } else {
      
      currentImage = loadImage(interactiveObjects[i][5]);
      
    }
      image(currentImage, int(interactiveObjects[i][1]), int(interactiveObjects[i][2]));   
  }
}

// Handles the mouse input on the interactive objects
void mouseClicked() {
  
  if (nextActionIsPosible != false) {
    if (nextAction == "change scene") {
        changeScene();
    } else if(nextAction == "print") {
      print(nextScene);
    } else if(nextAction == "select") {
      select();
    } else if (nextAction == "submit") {
      submit();
    } else if (nextAction == "continue") {
      continueGame();
    } else if (nextAction == "next dialogue") {
      ndialogue();
    } else if (nextAction == "previous dialogue") {
      pdialogue();
    }
  }
}
