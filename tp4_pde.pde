/* Nombre: Nazareno Carlos Bosio
   Legajo: 88885/6 */

// Creates base variables
int scene = 0;
PImage background;
PImage interactiveObject;
String[][] interactiveButtons;
boolean nextActionIsPossible = false;
String nextAction;
String nextScene;
PFont font;
int branchCounter;
int branchLimit = 28;
String currentBranch = "original";

// Checks if the mouse is on a button
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

// Changes Scenes
void changeScene() {
  scene = int(nextScene);
}

// Draws the menu
void drawMenu() {
  
  // Re sets all variables
  interactiveButtons = new String[2][9];
  branchCounter = 0;
  currentBranch = "original";
  
  // Loads the images and buttons
  String[] playButton = new String[9];
  playButton[0] = "enabled";
  playButton[1] = "300";
  playButton[2] = "400";
  playButton[3] = "200";
  playButton[4] = "40";
  playButton[5] = "play.png";
  playButton[6] = "playHover.png";
  playButton[7] = "changeScene";
  playButton[8] = "1";
  
  String[] creditsButton = new String[9];
  creditsButton[0] = "enabled";
  creditsButton[1] = "300";
  creditsButton[2] = "500";
  creditsButton[3] = "200";
  creditsButton[4] = "40";
  creditsButton[5] = "credits.png";
  creditsButton[6] = "creditsHover.png";
  creditsButton[7] = "changeScene";
  creditsButton[8] = "2";
  
  
  interactiveButtons[0] = playButton;
  interactiveButtons[1] = creditsButton;
  
  background = loadImage("menuBackground.png");
  image(background, 0, 0);
}

// Draws the story
void drawStory() {
  interactiveButtons = new String[6][9];
  
  // Loads images and buttons into arrays
  background = loadImage("storyBackground.png");
  image(background, 0, 0);
  
  String[] previousButton = new String[9];
  previousButton[0] = "disabled";
  previousButton[1] = "40";
  previousButton[2] = "200";
  previousButton[3] = "40";
  previousButton[4] = "60";
  previousButton[5] = "previousButton.png";
  previousButton[6] = "previousButtonHover.png";
  previousButton[7] = "previousText";
  previousButton[8] = "1";
  
  String[] nextButton = new String[9];
  nextButton[0] = "disabled";
  nextButton[1] = "720";
  nextButton[2] = "200";
  nextButton[3] = "40";
  nextButton[4] = "60";
  nextButton[5] = "nextButton.png";
  nextButton[6] = "nextButtonHover.png";
  nextButton[7] = "nextText";
  nextButton[8] = "1";
  
  String[] storyImage = new String[9];
  storyImage[0] = "enabled";
  storyImage[1] = "200";
  storyImage[2] = "100";
  storyImage[3] = "400";
  storyImage[4] = "360";
  storyImage[5] = "test1.png";
  storyImage[6] = "test1.png";
  storyImage[7] = "nothing";
  storyImage[8] = "";
  
  String[] option1 = new String[9];
  option1[0] = "disabled";
  option1[1] = "200";
  option1[2] = "100";
  option1[3] = "180";
  option1[4] = "260";
  option1[5] = "credits.png";
  option1[6] = "creditsHover.png";
  option1[7] = "nothing";
  option1[8] = "";
  
  String[] option2 = new String[9];
  option2[0] = "disabled";
  option2[1] = "500";
  option2[2] = "100";
  option2[3] = "180";
  option2[4] = "260";
  option2[5] = "credits.png";
  option2[6] = "creditsHover.png";
  option2[7] = "nothing";
  option2[8] = "";
  
  interactiveButtons[0] = previousButton;
  interactiveButtons[1] = nextButton;
  
  // Handles the go back and next buttons for the text
   if (branchCounter == 0 && currentBranch == "suicide") {
    previousButton[0] = "enabled";
    previousButton[7] = "changeBranch";
    previousButton[8] = "original";
   
   } if (branchCounter == 0 && currentBranch == "backyard") {
    previousButton[0] = "enabled";
    previousButton[7] = "changeBranch";
    previousButton[8] = "original";
   
   } else if (branchCounter > 0) {
    previousButton[0] = "enabled";
    previousButton[7] = "previousText";
   }
    
    // Modifies and enables the options when needed
    
  if (branchCounter <= branchLimit && branchCounter != 6 && branchCounter != 19){
    nextButton[0] = "enabled";
   } else if (branchCounter == 1 + branchLimit){
    nextButton[0] = "enabled";
    nextButton[7] = "changeScene";
    nextButton[8] = "2";
   } else if(branchCounter == 6 && currentBranch == "original") {
    option1[0] = "enabled";
    option1[5] = "bed.png";
    option1[6] = "bedHover.png";
    option1[7] = "changeBranch";
    option1[8] = "suicide";
    option2[0] = "enabled";
    option2[5] = "door.png";
    option2[6] = "doorHover.png";
    option2[7] = "nextText";
    option2[8] = "1";
    storyImage[0] = "disabled";
 } else if(branchCounter == 19 && currentBranch == "original") {
    option1[0] = "enabled";
    option1[5] = "shovel.png";
    option1[6] = "shovelHover.png";
    option1[7] = "changeBranch";
    option1[8] = "backyard";
    option2[0] = "enabled";
    option2[5] = "boards.png";
    option2[6] = "boardsHover.png";
    option2[7] = "nextText";
    option2[8] = "1";
    storyImage[0] = "disabled";
 }
  
  // Calls the function textBranch and loads the buttons onto the global array
  textBranch(storyImage);
  interactiveButtons[2] = storyImage;
  interactiveButtons[3] = option1;
  interactiveButtons[4] = option2;
  
}

// Handles all the text and images on the story
void textBranch(String[] image) {
  fill(255);
  
  // Loads all of the text in arrays
  String[] firstBranch = new String[30];
  firstBranch[0] = "¡Es verdad! Soy muy nervioso, horrorosamente nervioso, pero ¿por\nqué pretendéis que esté loco? La enfermedad ha aguzado\nmis sentidos. Tenía el oído muy fino, he escuchado todas las cosas\ndel cielo y de la tierra,y no pocas del infierno.";
  firstBranch[1] = "Ahora veréis con qué sano juicio y con qué calma puedo referirles\ntoda la historia.";
  firstBranch[2] = "Me es imposible decir cómo se me ocurrió primeramente la idea,\npero una vez concebida, no pude desecharla ni de noche ni de\ndía. Amaba al buen anciano, pues jamás me habia hecho daño\nalguno ni envidiaba su oro, pero sí tenía algo desagradable.";
  firstBranch[3] = "¡Era uno de sus ojos, sí, esto es! Se asemejaba al de un buitre y tenía\nel color azul pálido. Cada vez que este ojo fijaba en mí su\nmirada, se me helaba la sangre en las venas. Gracias a esto comenzó\na germinarse la idea de arrancar la vida al viejo, a fin de librarme\npara siempre de aquel ojo que me molestaba.";
  firstBranch[4] = "Durante 7 noches, a eso de las doce, abría la puerta suavemente. Y\ncuando quedaba bastante espacio para pasar la cabeza, introducía\nuna linterna sorda bien cerrada, para que no filtrase ninguna luz\ny alargaba el cuello. ";
  firstBranch[5] = "Un loco no habría sido tan prudente. Y cuando mi cabeza estaba\ndentro de la habitación, apuntaba la linterna al ojo del\nviejo, pero siempre lo encontré cerrado, y por consiguiente, me fué\nimposible consumar mi obra.";
  firstBranch[6] = "Llegada la octava noche, procedí con más precaución aún para\nabrir la puerta. Y con ello, me llegó el último atisbo de duda.\n¿Debería continuar con esto?";
  firstBranch[7] = "Abrí la puerta, la aguja de un reloj se hubiera movido\nmás rápidamene que mi mano. Mis facultades y mi sagacidad\nestaban más desarrolladas que nunca y apenas podía reprimir\nla emoción de mi triunfo.";
  firstBranch[8] = "Su habitación estaba negra como un pez, tan espesas eran\nlas tinieblas que, pues mi hombre había cerrado herméticamente\nlos postigos por temor a los ladrones, y sabiendo que no podía ver\nla puerta entornada, seguí empujándola más, siempre más.";
  firstBranch[9] = "Había pasado ya la cabeza y estaba a punto de abrir la linterna,\ncuando mi pulgar se deslizó sobre el muelle con que se\ncerraba y el viejo se incorporó en su lecho exclamando\n¡¿Quién anda ahí?!";
  firstBranch[10] = "Permanecí inmóvil sin contestar, durante una hora me mantuve\ncomo petrificado, y en todo este tiempo no le vi echarse\nde nuevo, seguía sentado y escuchando, como yo lo había hecho\nnoches enteras.";
  firstBranch[11] = "Pero he aquí que de repente oigo una especie de queja débil,\ny reconozco que era debida a un terror mortal; no era de\ndolor ni de pena. Era el ruido sordo y ahogado que se eleva de\nfondo de un alma poseída por el espanto.";
  firstBranch[12] = "Yo conocía bien ese ruido, pues muchas noches a las doce,\ncuando todos dormían, lo oí producirse en mi pecho,\naumentando con su eco terrible el terror que me embargaba. Por eso\ncomprendía tan bien lo que el viejo experimentaba.";
  firstBranch[13] = "Esperé un poco sin suerte a que el viejo se echase a dormir,\nasí que abrí entreabrí la linterna, hasta que un\nsolo rayo pálido, como hilo de araña, salió de la abertura y se\nproyectó en el ojo de buitre.";
  firstBranch[14] = "Estaba abierto, muy abierto, se veía cubierto con una especie\nde velo hediondo que heló mi sangre hasta la médula.";
  firstBranch[15] = "¿No os he dicho ya que lo que tomabais por locura no es sino\nun refinamiento de los sentidos? En aquel momento, un ruido\nsordo, ahogado y frecuente, semejante al que produce un reloj\nenvuelto en algodón, hirió mis oídos; aquel rumor, lo reconocí,\nera el latido del corazón del anciano, y aumentó mi cólera.";
  firstBranch[16] = "Por espacio de algunos minutos me contuve aún, pues aquel\nlatido se producía con redoblada fuerza cada minuto. Había\nllegado la última hora del viejo: profiriendo un alarido, abrí\nbruscamente la linterna y me introduje en la habitación. El buen\nhombre solo dejó escapar un grito, solo uno.";
  firstBranch[17] = "En un instante le arrojé en el suelo, reí de contento al\nver mi tarea tan adelantada, aunque esta vez ya no me\natormentaba, pues no se podía oír a través de la pared. Al fin cesó\nla palpitación, porque el viejo había muerto.";
  firstBranch[18] = "Si persistís en tomarme por loco, esa creencia se desvanecerá\npronto cuando os diga que precauciones adopté para ocultar\nel cadáver. La noche avanzaba, y comencé a trabajar activamente,\naunque en silencio corté la cabeza, después los brazos\ny por último las piernas.";
  firstBranch[19] = "La unica duda ahora era donde esconder el cadáver, lo más rápido\nsería arrancar tres tablas del suelo del cuarto, pero\ntambién podría enterrarlo en el patio y dejar que los\ngusanos se encarguen de su cuerpo.";
  firstBranch[20] = "En seguida arranqué tres tablas del suelo de la habitación,\ndeposité los restos mutilados en los espacios huecos, y volví\na colocar las tablas. Lo hice con tanta destreza y\nhabilidad que ningún ojo humano podría saber que ahí se\nencontraba un cadáver.";
  firstBranch[21] = "No era necesario lavar mancha alguna, gracias a la prudencia\ncon la que procedía. Un barreno la había absorbido toda.\n¡Ja, ja!";
  firstBranch[22] = "Terminada la operación, a eso de las cuatro de la madrugada,\naún estaba tan oscuro como a medianoche. Cuando el reloj\nseñaló la hora, llamaron a la puerta de calle, y yo bajé\ncon la mayor calma para abrir, pues, ¿qué podía temer ya?";
  firstBranch[23] = "Yo sonreí, porque nada debía temer, y recibiendo cortésmente\na aquellos caballeros, les dije que era yo quien había\ngritado en medio de mi sueño; añadí que el viejo estaba de\nviaje, y conduje a los oficiales por todo el interior de\nla casa, invitándoles a buscar, a registrar perfectamente. ";
  firstBranch[24] = "Al fin entré en su habitación y mostré sus tesoros completamente\nseguros y en el mejor orden. En el entusiasmo de mi confianza\nofrecí sillas a los visitantes para que descansaran un poco;\nmientras que yo, con la loca audacia de un triunfo\ncompleto, coloqué la mía en el sitio mismo donde lo asesiné.";
  firstBranch[25] = "Los oficiales quedaron satisfechos y convencidos por mis modales,\nse sentaron y hablaron de cosas familiares, a las que\ncontesté alegremente.";
  firstBranch[26] = "Al poco tiempo palidecí y ansíe la marcha de aquellos hombres. Me\ndolía la cabeza y parecía que mis oídos zumbaban, pero\nlos oficiales continuaban sentados, hablando sin cesar. El zumbido\nse pronunció más, persistiendo con mayor fuerza.";
  firstBranch[27] = "Me puse a charlar sin tregua cada vez más fuerte para intentar tapar\naquella sensación, pero todo fué inútil y al fin descubrí que\nel rumor no se producía en mis oídos. Aparentando que\nme exasperaban sus observaciones, di varias vueltas de\nun lado a otro de la habitación, más el rumor aumentaba";
  firstBranch[28] = "Y los oficiales seguían hablando, bromeaban, y sonreían. ¿Sería\nposible que no oyesen? ¡Dios todo poderoso! ¡No, no!\nLo sabían y se divertían con mi espanto. Cualquier cosa era\npreferible a semejante burla. ";
  firstBranch[29] = "¡Miserables! - exclamé – No disimuléis más tiempo, confieso\nel crimen. ¡Arrancad esas tablas! Ahí está, ¡Es el latido\nde su espantoso corazón!";
  
  String[] secondBranch = new String[5];
  secondBranch[0] = "Tomé la desición de abandonar el plan, una fuerza que\ndesconozco hizo que cerrara la puerta frente a mí. Me marché\na mi habitación e intenté dormir aquella noche.\n¡Si lo hubiese supido! El ojo del madito viejo me seguía acosando\nen sueños.";
  secondBranch[1] = "De varias maneras intenté evitarlo, comencé a no mirar\nal viejo a los ojos, pero su mirada penetraba igualmente.";
  secondBranch[2] = "Todas las mañanas y todas las noches ese color azul me perseguía.\nLe recé a Dioses y demonios, intenté sacarme los ojos, pero\ndicha sensación ya no provenía solamente del exterior, podía sentir\na ese ojo ríendo dentro mío. Y no sabía como detenerlo.";
  secondBranch[3] = "Tomé una soga vieja del galpón en la noche, y sellé mi destino.";
  secondBranch[4] = "Pateé la silla y dejé mi cuerpo desplomarse sobre la soga,\n¡Qué libertad sentí! ¡Qué regocijo! Pude sentir como la\nagonía liberaba mi cuerpo, como de a poco, iba perdiendo\nla consciencia. Pero mientras estaba despidiéndome de este mundo,\npude escuchar reír al viejo.";
  
  String[] thirdBranch = new String[8];
  thirdBranch[0] = "En seguida comencé a cavar cinco pozos de un metro de\nprofundidad, deposité los restos mutilados en los espacios huecos y\ncomencé a emparejar la tierra. Lo hice con tanta destreza\ny habilidad que ningún ojo humano podría saber que ahí se\nencontraba un cadáver.";
  thirdBranch[1] = firstBranch[21];
  thirdBranch[2] = firstBranch[22];
  thirdBranch[3] = firstBranch[23];
  thirdBranch[4] = firstBranch[24];
  thirdBranch[5] = firstBranch[25];
  thirdBranch[6] = "Luego de media hora de charla de nimiedades, los oficiales se\nretiraron. Los saludé alegremente y trabé la puerta detrás suyo.\n¡Al fin! La tortura de tener que despertar al viejo por las mañanas\ny atender sus necesidades mientras me veía con el ojo de cuervo.\nPodría descansar por la noche sin preocuparme porque esté ahí.";
  thirdBranch[7] = "Me dirigí a mi alcoba y me acosté en la cama, la dulce sensación\nde la victoria me arulló hasta quedarme dormido.";
  
  // Changes the text that is being drawn
  if(currentBranch == "original") {
    text(firstBranch[branchCounter], 20, 450);
    branchLimit = 28;
  } else if(currentBranch == "suicide") {
    text(secondBranch[branchCounter], 20, 450);
    branchLimit = 3;
  } else if(currentBranch == "backyard") {
    text(thirdBranch[branchCounter], 20, 450);
    branchLimit = 5;
  }
  
  // Changes the image being drawn depending on the current text
  if (currentBranch == "original") {
    if (branchCounter < 3) {
      image[5] = "oldman.png";
      image[6] = "oldman.png";
    } else if (branchCounter < 6) {
      image[5] = "eye.png";
      image[6] = "eye.png";
    } else if (branchCounter < 10) {
      image[5] = "darkBed.png";
      image[6] = "darkBed.png";
    } else if (branchCounter < 13) {
      image[5] = "clock.png";
      image[6] = "clock.png";
    } else if (branchCounter < 16) {
      image[5] = "heart.png";
      image[6] = "heart.png";
    } else if (branchCounter < 19) {
      image[5] = "dyingMan.png";
      image[6] = "dyingMan.png";
    } else if (branchCounter < 23) {
      image[5] = "clock.png";
      image[6] = "clock.png";
    } else if (branchCounter < 26) {
      image[5] = "chair.png";
      image[6] = "chair.png";
    } else if (branchCounter < 30) {
      image[5] = "heart.png";
      image[6] = "heart.png";
    }
  }
  
  if (currentBranch == "suicide") {
    if (branchCounter < 3) {
      image[5] = "eye.png";
      image[6] = "eye.png";
    } else if (branchCounter < 5) {
      image[5] = "rope.png";
      image[6] = "rope.png";
    }
  }
  
  if (currentBranch == "backyard") {
    if (branchCounter < 3) {
      image[5] = "clock.png";
      image[6] = "clock.png";
    } else if (branchCounter < 5) {
      image[5] = "chair.png";
      image[6] = "chair.png";
    } else if (branchCounter < 8) {
      image[5] = "tombstone.png";
      image[6] = "tombstone.png";
    }
  }
  
}

// Draws the credits scene
void drawCredits() {
  interactiveButtons = new String[1][9];
  background(255);
  
  // Loads all the buttons and images
  String[] menuButton = new String[9];
  menuButton[0] = "enabled";
  menuButton[1] = "300";
  menuButton[2] = "500";
  menuButton[3] = "200";
  menuButton[4] = "40";
  menuButton[5] = "backToMenu.png";
  menuButton[6] = "backToMenuHover.png";
  menuButton[7] = "changeScene";
  menuButton[8] = "0";
  
  interactiveButtons[0] = menuButton;
  background = loadImage("creditsBackground.png");
  image(background, 0, 0);
}

// Changes the story branch
void changeBranch() {
  if (currentBranch == "suicide") {
    branchCounter = 6;
  } else if (currentBranch == "backyard") {
    branchCounter = 19;
  } else if (currentBranch == "original") {
    branchCounter = 0;
  }
  currentBranch = nextScene;
}

// Initializes the program
void setup(){
  size(800, 600);
  font = createFont("font.otf", 25);
  textFont(font);
  branchCounter = 0;
}

// Draws on to the screen
void draw(){
  // Resets the variable
  nextActionIsPossible = false;
  
  // Checks wich scene needs to draw
  if (scene == 0) {
    drawMenu();
  } else if(scene == 1){
    drawStory();
  } else if(scene == 2){
    drawCredits();
  }
  
  // For every item in interactiveButtons, checks if it's enabled and handles the interactivity and drawing the image 
  for (int i = 0; i < interactiveButtons.length; i++) {
    if(interactiveButtons[i][0] == "enabled") {
      if (isHovering(interactiveButtons[i][1], interactiveButtons[i][2], interactiveButtons[i][3], interactiveButtons[i][4])) {
      nextActionIsPossible = true;
      nextAction = interactiveButtons[i][7];
      nextScene = interactiveButtons[i][8];
      interactiveObject = loadImage(interactiveButtons[i][6]);
 
    } else {
      
      interactiveObject = loadImage(interactiveButtons[i][5]);
      
    }
      image(interactiveObject, int(interactiveButtons[i][1]), int(interactiveButtons[i][2]));   
  }
    }
}

// In case of a click, checks wich command is being used and calls the method needed
void mouseClicked() {
  
  if (nextActionIsPossible != false) {
    if (nextAction == "changeScene") {
        changeScene();
    } else if (nextAction == "previousText") {
        branchCounter -= 1;
    } else if (nextAction == "nextText") {
        branchCounter += 1;
    } else if (nextAction == "changeBranch") {
        changeBranch();
    }
  }
}
