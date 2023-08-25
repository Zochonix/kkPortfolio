
// This file will be the basis for my game, from here all of the 
// game's initial methods and variables will be set, accessed and modified when necessary.

enum gameState {

  // The gameState enum will be used to tell the
  // draw procedure what it should be drawing,
  // by identifying what state the user is up to
  // within the program.
  
  INITIAL,
  ACTIVE, 
  PAUSE,
  LEVEL_CHANGE,
  GAME_OVER,
  GAME_FINISHED

}

// Instance variables are declared below to access the required classes.

Submarine submarine;
Level level;
CollisionDetection collision;

// The state of the game is initially set to INITIAL
// to tell the program to draw the start screen.

gameState state = gameState.INITIAL;

// Start the game with the setup procedure.

void setup() {

  size(1280, 720);
  surface.setTitle("Xenalysio: Echo for the Dawn");
  loadInitialState();
  
}

// Draws different elements to the screen
// depending on the state of the game.

void draw() {
    
    if (state == gameState.ACTIVE) {
      
      drawUI();
      
    }
    
    if (state == gameState.GAME_OVER) {
    
      handleGameOver();
    
    }
    
    if (state == gameState.LEVEL_CHANGE) {
    
      nextLevelUI();
      
    }
    
    if (state == gameState.GAME_FINISHED) {
    
      drawEndScreen();
      
    }
  
}

void keyPressed () {
  
  // Call the move procedure in the submarine class to control the
  // movement of the submarine, also call the createBullet procedure when
  // f/F is pressed on the keyboard to make a new bullet (torpedo).
  
  submarine.move(keyCode == LEFT, keyCode == RIGHT, keyCode == UP, keyCode == DOWN);
  submarine.createBullet(key == 'f' || key == 'F');
  
  // The below procedure draws the intro screen to the user when they press enter.
  // This screen is provides the backstory for the game.
  
  if ((key == ENTER) && (state == gameState.INITIAL) && (level.getIntroCompleted() == false)) { 
  
    drawIntroScreen();
    level.setIntroCompleted(true);
  
  }
  
  // Changes the state of the game to ACTIVE, which causes the program to start
  // drawing and updating the main UI to the screen.
  
  if ((key == 'c' || key == 'C') && (state == gameState.INITIAL) && (level.getIntroCompleted() == true) ) {
      
      state = gameState.ACTIVE;
      
    }
    
  // When p/P is pressed, open the pause menu and change the state accordingly.  
  
  if ((key == 'p' || key == 'P') && (state == gameState.ACTIVE)) {
    
      state = gameState.PAUSE;
      drawPauseMenu();
    
  }
  
  // If the pause menu is already open, change the state back to active when
  // p/P is pressed.
    
  else if ((key == 'p' || key == 'P') && (state == gameState.PAUSE)) {
    
      state = gameState.ACTIVE;
    
  }
  
  // When the user encounters the game over screen or they have finished the game,
  // reset the state of the game to active and reset all key variables.
  
  if ((key == ENTER) && (state == gameState.GAME_OVER || state == gameState.GAME_FINISHED)) {
  
    gameReset();
    state = gameState.ACTIVE;
  
  }
  
  // When the user has finished a level, and they press ENTER,
  // change the gameState back to active.
  
  if ((key == ENTER) && (state == gameState.LEVEL_CHANGE)) {
  
    state = gameState.ACTIVE;
  
  }
  
}

// Draws the intro screen to the user, explaining the story.

void drawIntroScreen() {

  PImage continueText = loadImage("continueText_256.png");
  background(33, 150, 243);
  rectMode(CENTER);
  fill(19, 91, 207);
  rect(width / 2, height / 2, 512, 512, 7);
  rectMode(CORNER);
  textSize(18);
  textAlign(CENTER);
  fill(255);
  text("Introduction", width / 2, height / 2 - 220);
  textSize(16);
  text("Listen up!", width / 2, height / 2 - 180);
  text("You are about to embark on a dangerous mission.", width / 2, height / 2 - 140);
  text("Huge disturbances are being detected all over the globe and we", width / 2, height / 2 - 90);
  text("believe that there are... creatures, lurking in the deep with", width / 2, height / 2 - 70);
  text("unimaginable destructive capabilities.", width / 2, height / 2 - 50);
  text("You have been supplied with one of our most advanced", width / 2, height / 2);
  text("submarines, the SSBN Triphoria, which is equipped with", width / 2, height / 2 + 20);
  text("a fully-automated ZP3 torpedo system. You will also have", width / 2, height / 2 + 40);
  text("a team of scientists with you who will be able to extract", width / 2, height / 2 + 60);
  text("any artifacts you find during your mission.", width / 2, height / 2 + 80);
  text("Please remember, that the fate of this world may depend", width / 2, height / 2 + 120);
  text("on what you are able to accomplish during this mission.", width / 2, height / 2 + 140);
  text("All of us, all of the world, believe that you are the one person", width / 2, height / 2 + 180);
  text("who can successfully complete this mission.", width / 2, height / 2 + 200);
  text("You are nearing the epipelagic zone now, get ready!", width / 2, height / 2 + 240);
  textAlign(BASELINE);
  image(continueText, width - 256, height - 20);
  textAlign(LEFT, BOTTOM);
  textSize(20);
  textAlign(BASELINE);

}

// Draws the pause menu, explaining the controls and providing some key information.

void drawPauseMenu() {

  rectMode(CENTER);
  fill(19, 91, 207);
  rect(width / 2, height / 2, 512, 512, 7);
  rectMode(CORNER);
  textSize(18);
  textAlign(CENTER);
  fill(255);
  text("Game Paused.", width / 2, height / 2 - 220);
  textSize(16);
  text("Controls:", width / 2, height / 2 - 180);
  text("f/F - Fires Torpedos", width / 2, height / 2 - 140);
  text("Arrow Keys - Moves Submarine", width / 2, height / 2 - 120);
  text("Chests Explained:", width / 2, height / 2 - 80);
  text("Blue Chests will increase your score", width / 2, height / 2 - 40);
  text("Red Chests will decrease your score", width / 2, height / 2 - 20);
  text("White Chests will give an upgrade", width / 2, height / 2);
  text("Upgrades Explained:", width / 2, height / 2 + 40);
  text("Upgrade 1 - Damage Increase: Torpedos deal double damage.", width / 2, height / 2 + 80);
  text("Upgrade 2 - Shield Activation: You get a shield which", width / 2, height / 2 + 100);
  text("will protect you from 5 hits.", width / 2, height / 2 + 120);
  text("Upgrade 3 - Health Refill: Refills health completely.", width / 2, height / 2 + 140);
  text("Please remember that the upgrades are random!", width / 2, height / 2 + 180);
  text("Now get back to the mission!", width / 2, height / 2 + 220);
  textAlign(BASELINE);

} 

// When the user releases one of the arrow keys, the endMovement procedure is triggered,
// which tells the game that dx and dy should be set to 0 because no movement is occurring.

void keyReleased () {
  
  submarine.endMovement(keyCode == LEFT, keyCode == RIGHT, keyCode == UP, keyCode == DOWN);
  
}

// Renders the initial screen ofi the program by setting a bg colour
// and providing key images, as well as setting the main instances
// of the program that will be used by all methods in this class.

void loadInitialState() {
  
  background(33, 150, 243);
  setImages();
  setInstances();
  
}

// Sets the key images which will appear on the intro screen.

void setImages() {

  PImage welcomeText, welcomeText2;
  welcomeText = loadImage("welcomeText_592.png");
  welcomeText2 = loadImage("welcomeText2_128.png");
  image(welcomeText, width - 1275, height - 710);
  image(welcomeText2, width - 1275, height - 444);
  textAlign(RIGHT, BOTTOM);
  textSize(20);
  text("Press ENTER to continue.", width - 2, height);
  textAlign(BASELINE);
  
}

// Sets the main instances of the game from which most methods will be called.

void setInstances() {

  level = new Level(1, 0, 20);
  createSubmarine(state);
  collision = new CollisionDetection();
  
}

// Create the main submarine instance and display it to the screen at the specified X and Y coordinates.

void createSubmarine(gameState state) {
  
  float x = width / 2 - 32;
  float y = height / 2;
  
  submarine = new Submarine(x, y);
  submarine.display(state);

}

// This is the main procedure that will run whilst the state of the game is ACTIVE.
// It constantly checks all instances that are on the screen, performs actions
// when it recognises collisions and tells the game to change state if
// certain conditions are met.

void drawUI() {

  background(level.getBG());
  updateInstances();
  checkCollisions();
  updateHealth();
  updateLevelInfo();
  checkAdvance();
  
}

// updateInstances() constantly updates the position of the submarine,
// and calls the drawEnemy and generateChest methods at the same time
// but these methods contain variables which determine whether an enemy
// or chest will be drawn to the screen or not.

void updateInstances() {

  submarine.display(state);
  level.drawEnemy();
  level.generateChest();
  
}

// Calls procedures to check for different types of collisions.

void checkCollisions() {
  
  bubbleBorder();
  playerBorder();
  playerEnemy();
  playerChest();
  bulletEnemy();
  bulletBorder();
  enemyBorder();

}

// bubbleBorder() uses a reverse for loop to remove each bubble from the array list
// and hence from the screen once it is past the top of the screen.

void bubbleBorder() {

  for(int i = submarine.getBubblesSize() - 1; i >= 0; i--) {
  
    float bubbleY = submarine.getBubbleY(i);
  
      if (collision.bubbleBorderCheck(bubbleY) == true) {
      
        submarine.removeBubble(i);
        
      }
  
  }

}

// playerBorder() creates an array of float values, which then updates the actual values of the submarine
// after it has checked to determine whether the array has come into contact with the borders of the screen.

// NOTE: An array is used because we have to return multiple values.

void playerBorder() {
  
  float[] new_values = collision.checkBorderCollision(submarine.getSubmarineX(), submarine.getSubmarineY());
  
  submarine.setSubmarineX(new_values[0]);
  submarine.setSubmarineY(new_values[1]);

}

// playerEnemy() uses a reverse for loop to go through the array list of enemies
// and then remove them if they have collided with the player.

void playerEnemy() {

  for(int i = level.getEnemiesSize() - 1; i >= 0; i--) { // For each enemy on the screen...
  
    float enemyX = level.getEnemyX(i);
    float enemyY = level.getEnemyY(i); // Get the X and Y values of that enemy...
    
    if (collision.playerCollidesWithEnemy(submarine.getSubmarineX(), submarine.getSubmarineY(), enemyX, enemyY) == true) {
    
      // If the player has collied with an enemy, remove the enemy and deal damage to the player.
      // If they have a shield then take away shield health instead.
      
      level.removeEnemy(i);
      submarine.decreaseHealth();
      
      if (submarine.getSubmarineHealth() <= 0) {
        
        state = gameState.GAME_OVER;
        
      }
      
    }
    
  }

}

// PlayerChest() checks for collisions between the player and the chests, if a collision is detected then
// determine what class the chest that the player collided with is from, and then perform certain effects accordingly.

void playerChest() {
  
  // Firstly, get the X and Y coordinate of each chest instance using a reverse for loop.
  
  for(int i = level.getChestsSize() - 1; i >= 0; i--) { // For each chest in the array list.
  
    float chestX = level.getChestX(i);
    float chestY = level.getChestY(i); // Get the X and Y values of the chest.
    
    if (collision.playerCollidesWithChest(submarine.getSubmarineX(), submarine.getSubmarineY(), chestX, chestY) == true) {
    
      // Determine the type of chest that the player has collided with.
      
      if (level.getChest(i) instanceof BlueChest) {
      
        // Increase and update the player's score.
        
        int new_score = level.getScore() + ((BlueChest) level.getChest(i)).getValue();
        level.setScore(new_score);
        String playerScore = "Score: " + new_score;
        level.setPlayerScore(playerScore);
        updateLevelInfo();
        level.removeChest(i);
      
      }
      
      else if (level.getChest(i) instanceof RedChest) {
      
        // Decrease and update the player's score
        
        if (level.score - 250 >= 0) {
        
          int new_score = level.getScore() + ((RedChest) level.getChest(i)).getValue();
          level.setScore(new_score);
          String playerScore = "Score: " + new_score;
          level.setPlayerScore(playerScore);
          updateLevelInfo();
          level.removeChest(i);
          
        }
        
        else {
          
          // Prevent negative scoring.
          
          level.removeChest(i);
        
        }
      
      }
      
      else if (level.getChest(i) instanceof WhiteChest) {
      
        // 1 - Higher Bullet Damage if on Level 2
        // 2 - Shield for 5 Enemies
        // 3 - Health Refill
        
        int effectSelector = int(random(3)); // So that the effect is random.
        
          if (effectSelector == 0) {
          
            submarine.clearBullets();
            submarine.activateHigherDamage();
          
          }
          
          else if (effectSelector == 1) {
          
            submarine.activateShield();
          
          }
          
          else if (effectSelector == 2) {
          
            submarine.refillHealth();
          
          }
        
        level.removeChest(i);
      
      }
      
    }
    
  }

}

// bulletEnemy() check to see if a bullet has collided with an enemy using 2 reverse for loops
// which each iterate through array lists of both the bullet and the enemy. Firstly,
// the array list of the enemy is iterated through, retrieving the x and y values for that enemy
// as well as it's health, and then the program goes through each bullet instance in the array list
// and retrieves its needed values. Then a collision method is called and if the resulting collision
// turns out to be true then the enemy takes damage equal to that of the bullet, if the health of the enemy
// is then less than 0, the enemy instance is removed otherwise the enemies health gets updated and only the
// bullet is removed.

void bulletEnemy() {
  
  for(int i = level.getEnemiesSize() - 1; i >= 0; i--) { // For each enemy
  
    float enemyX = level.getEnemyX(i); // This value crashes why? Something to do with the fact that enemies are removed?
    float enemyY = level.getEnemyY(i); // Get the X and Y values of that enemy.
    int enemyHealth = level.getEnemyHealth(i);
    
    for(int j = submarine.getBulletsSize() - 1; j >= 0; j--) { // For each bullet on the screen.
      
      float bulletX = submarine.getBulletX(j);
      float bulletY = submarine.getBulletY(j); 
      int bulletDamage = submarine.getBulletDamage(j); // Get values of bullet.
      
      if (collision.bulletHitsEnemy(bulletX, bulletY, enemyX, enemyY) == true) { //If there is a collision between an enemy and a bullet
        
        enemyHealth -= bulletDamage;
        
        if (enemyHealth <= 0) {
        
          submarine.removeBullet(j);
          level.updateEnemyCount(i);
          i--;
          j--;
        
        }
        
        else if (enemyHealth != 0) {
          
          level.setEnemyHealth(i, enemyHealth); 
          level.updateEnemyY(i, 50);
          submarine.removeBullet(j);
          j--;
          
        }
      
      }
      
    }
    
  }

}

// bulletBorder() uses a reverse for loop to iterate through the bullets array list and retrieve the Y coordinate
// of each bullet that gets fired, if the bullet goes past the bottom of the screen then it is removed from the array list.

void bulletBorder() {

  for(int i = submarine.getBulletsSize() - 1; i >= 0; i--) {
  
    float bulletY = submarine.getBulletY(i);
  
      if (collision.bulletBorderCheck(bulletY) == true) {
      
        submarine.removeBullet(i);
        
      }
  
  }

}

// enemyBorder() uses a reverse for loop to iterate through the enemies array list and retrieve the X and Y coordinates
// for each enemy instance in the list, then they are used to tell if an enemy has gone past one of the borders of the
// program, if this is the case then that enemy is removed from the array list.

void enemyBorder() {

  for (int i = level.getEnemiesSize() - 1; i >= 0; i--) {
    
    float enemyX = level.getEnemyX(i);
    float enemyY = level.getEnemyY(i);
  
    if (collision.enemyHitsTop(enemyY) == true) {
    
       level.removeEnemy(i);
      
    }
    
    else if (collision.enemyHitsSide(enemyX) == true) {
      
      // If there is a collision with the border, reverse the direction of the enemy.
      
      level.change_dx(i);
    
    }
  
  }

}

// updateHealth() is a procedure which draws/updates the health bar and draws/updates the shield of the submarine.

void updateHealth() {

  textSize(20);
  fill(255);
  text("Health", 10, 30); 
  fill(82, 163, 227);
  rect(85, 10, submarine.getSubmarineHealth(), 25, 7);
  
  if (submarine.getShield() != 0) {
  
    fill(255);
    text("Shield: ", 10, 150); 
    fill(235, 64, 52);
    rect(85, 130, submarine.getShield(), 25, 7);
  
  }
  
}

// updateLevelInfo() draws/updates key information about the game when called upon.

void updateLevelInfo() {

  fill(255);
  textSize(20);
  text("Level: " + level.getLevelNumber(), 10, 60);
  text(level.getEnemiesRemaining(), 10, 90);
  text(level.getPlayerScore(), 10, 120);
  textAlign(BASELINE);

}

// checkAdvance() is called upon to identify whether the user is able to advance to the next level
// or not, this is determined by using if statements to look at key variables.

void checkAdvance() {

  if (level.getCount() == 0 && level.getLevelNumber() == 1) {
  
    state = gameState.LEVEL_CHANGE;
    level.nextLevel();
  
  }
  
  else if (level.getCount() == 0 && level.getLevelNumber() == 2) {
  
    // Change the game state, reset everything, and ask if they would like to play again.
    
    state = gameState.GAME_FINISHED;
    drawEndScreen();
  
  }

}

// nextLevelUI() draws the UI for the screen which appears when you beat the first level.

void nextLevelUI() {

  background(33, 150, 243);
  textSize(24);
  textAlign(CENTER);
  text("Well Done! Welcome to " + level.getLevelTitle(), width / 2, height / 2);
  textSize(20);
  text("Press enter to begin. Be prepared.", width / 2, height / 2 + 60);
  textAlign(BASELINE);

}

// handleGameOver() draws the UI for the game over screen.

void handleGameOver() {

  background(18, 79, 128);
  textSize(24);
  textAlign(CENTER);
  text("GAME OVER.", width / 2, height / 2);
  textSize(20);
  text("The score you got was: " + level.getScore(), width / 2, height / 2 + 60);
  text("Press ENTER to restart the game.", width / 2, height / 2 + 100);
  textAlign(BASELINE);

}

// gameReset() is used to reset all key variables and update the UI with these new variables.

void gameReset() {

  level.reset();
  submarine.reset();
  updateHealth();
  updateLevelInfo();

}

// drawEndScreen() is used to draw the final screen once you beat the game.

void drawEndScreen() {

  background(33, 150, 243);
  textSize(24);
  textAlign(CENTER);
  text("Congratulations!", width / 2, height / 2);
  textSize(20);
  text("You beat the game! Your final score was: " + level.getScore(), width / 2, height / 2 + 60);
  text("Press ENTER to play again.", width / 2, height / 2 + 120);
  textAlign(BASELINE);

}
