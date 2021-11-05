float spaceshipX = 500;
float laserX = 100;
float laserY = 730;
float alienX = random(35, 965);
float alienY = 0;
float alien2X = random(35, 965);
float alien2Y = 0;
float popX = random(35, 965);
float popY = 840;

boolean alienAttack = true;
boolean alienAttack2 = true;
boolean spaceshipShot = false;
boolean populationFleed = false;

int pointsAlien = 0;
int pointsSpaceship = 0;
boolean gameEnded = false;
PImage player, ufo1, ufo2, backgroundImage, alien, astronaut, population;

void setup () {
  size (1000, 800);
  background (255);
  colorMode(HSB, 360, 100, 100);
  player = loadImage("./data/player.png");
  ufo1 = loadImage("./data/ufo.png");
  ufo2 = loadImage("./data/ufo 2.png");
  backgroundImage = loadImage("./data/bg.png");
  alien = loadImage("./data/alien.png");
  astronaut = loadImage("./data/astronaut.png");
  population = loadImage("./data/populationSpaceship.png");
}

void draw () {
  background(backgroundImage);
  fill(255);
 
  renderElements();
  moveSpaceship();
  attackAlien();
  alienSucced();
  shotSpaceship();
  spaceshipSucced();
  endGame();
  populationflight();
}

void renderElements() {
    if(gameEnded == false) {
    textSize(60);
    text("Aliens", 50, 75);
    text (pointsAlien, 300, 75);
    text ("Jogador", 600, 75);
    text (pointsSpaceship, 850, 75);
    image(ufo1, alienX, alienY, 50, 50);
    image(ufo2, alien2X, alien2Y, 50, 50);
    fill(3, 100, 86);
    rect(laserX, laserY, 5, 15);
    image(player, spaceshipX, 720, 50, 50);
  }
}

void moveSpaceship() { 
  if (keyPressed == true && key == CODED && keyCode == LEFT) {
    spaceshipX = spaceshipX - 9;
  }
  
  if (keyPressed == true && key == CODED && keyCode == RIGHT) {
    spaceshipX = spaceshipX + 9;
  }
   
  if (spaceshipX >= 1000) {
    spaceshipX = 970;
    textSize(60);
    fill(0,100,100);
    text ("DO NOT ESCAPE!", 250, 700);
  }
  if (spaceshipX <= 0) {
    spaceshipX = 30;
    textSize(60);
    fill(0,100,100);
    text ("DO NOT ESCAPE!", 250, 700);
  }
}

void attackAlien() {
  if (alienY <= 650) {
    alienAttack = true;
  }
  
  if (alien2Y <= 650) {
    alienAttack2 = true;
  }
  
  if (alienAttack == true) {
    alienY = alienY + 4;
  }
  
  if (alienAttack2 == true) {
    alien2Y = alien2Y + 4;
  }
}

void alienSucced() {
  if(gameEnded == false) {
    if (alienY > 750) {
      alienY = 0;
      alienX = random (30, 670);
      alienAttack = true;
      
      pointsAlien++;
    }
    if (alien2Y > 750) {
      alien2Y = 0;
      alien2X = random (30, 670);
      alienAttack = true;
      
      pointsAlien++;
    }
  }
}

void shotSpaceship() {
  
  
  if (keyPressed && key == ' ') {
    spaceshipShot = true;
  } 
  
  if (spaceshipShot == true) {
    laserY = laserY - 10;
  } else {
  laserX = spaceshipX + 20;
  }
   
  if (laserY < 10) {
    laserX = spaceshipX;
    laserY = 730;
    spaceshipShot = false;
  }
}

void spaceshipSucced() {
  if (gameEnded == false) {
      if (laserY < alienY + 20 && laserY > alienY - 20 && laserX < alienX + 20 && laserX > alienX - 20) {
        
      pointsSpaceship++;
      
      alienY = 0;
      alienX = random(35, 965);
      
      alienAttack = true;
      spaceshipShot = false;
      laserY = 730;
    }
        
     if (laserY < alien2Y + 20 && laserY > alien2Y - 20 && laserX < alien2X + 20 && laserX > alien2X - 20) {
      alien2Y = 0;
      alien2X = random(35, 965);
      
      alienAttack2 = true;
      spaceshipShot = false;
      
      pointsSpaceship++;
      laserY = 730;
    }
  }
}

void endGame() {
  if (pointsSpaceship >= 5) {
    gameEnded = true;
    textSize(100);
    fill (184,84,92);
    text ("END GAME", 250, 450);
    textSize(70);
    text ("You win", 380, 550);
    image(astronaut, 400, 120, 200,200);
  }
  if (pointsAlien >= 5) {
    gameEnded = true;
    textSize(100);
    fill(114, 80, 92);
    text ("END GAME", 250, 450);
    textSize(70);
    text ("Aliens win", 330, 550);
    image(alien, 400, 120, 200,200);
  }
}

void populationflight() {
  if (gameEnded == false) {
    image(population, popX, popY , 50, 50);
    if (pointsAlien == 4 & popX != alienX & popX != alien2X) {
      popY = popY - 5;
      
      textSize(50);
      fill(0,100,100);
      text ("Population Fleed!", 250, 450);
    }
  }
}
