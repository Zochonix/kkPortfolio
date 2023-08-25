// The Level class represents the levels of the game. It controls
// the properties of the level itself and also creates enemies
// and resources through calling the necessary methods of each class.


class Level {
  
  // Define the fields of the class.
  
  private int levelNumber; // The number of the level that the user is currently on.
  private int score; // The variable which holds the score of the user.
  private int count; // The variables that holds the number of users which the enemy has left to eliminate.
  private String levelTitle = "Level 1: Epipelagic Zone"; // The string variable that store the name of the level.
  private String enemiesRemaining; // The string variable which tells the user how many enemies they have left to eliminate.
  private String playerScore = "Score: " + score; // The playerScore variable that tells the user what their current score is.
  private ArrayList<Enemy> enemies = new ArrayList<Enemy>(); // An array list to store the enemies that will be generated.
  private ArrayList<Chest> chests = new ArrayList<Chest>(); // An array list to store the chests that will be drawn to the screen.
  private color bg = color(33, 150, 243);
  private boolean introCompleted = false;
  
  // Set a constructor to define initial fields with key values.
  
  Level(int levelNumber, int score, int count) {
  
    this.levelNumber = levelNumber;
    this.score = score;
    this.count = count;
    enemiesRemaining = "Enemy Count: " + count;
  
  }
  
  // Getter and Setters
  
  int getLevelNumber() {
  
    return levelNumber;
  
  }
  
  int getScore() {
  
    return score;
  
  }
  
  int getCount() {
  
    return count;
  
  }
  
  String getLevelTitle() {
  
    return levelTitle;
  
  }
  
  void setScore(int new_score) {
  
    score = new_score;
  
  }
  
  String getEnemiesRemaining() {
  
    return enemiesRemaining;
  
  }
  
  String getPlayerScore() {
  
    return playerScore;
  
  }
  
  void setPlayerScore(String new_playerScore) {
  
    playerScore = new_playerScore;
  
  }
  
  int getEnemiesSize() {
  
    return enemies.size();
  
  }
  
  float getEnemyX(int i) {
  
    return enemies.get(i).enemyX;
    
  }
  
  float getEnemyY(int i) {
  
    return enemies.get(i).enemyY;
    
  }
  
  void updateEnemyY(int i, float new_enemyY) {
  
    enemies.get(i).enemyY += new_enemyY;
    
  }
  
  int getEnemyHealth(int i) {
  
    return enemies.get(i).enemyHealth;
  
  }
  
  void setEnemyHealth(int i, int new_enemyHealth) {
  
    enemies.get(i).enemyHealth = new_enemyHealth;
  
  }
  
  void removeEnemy(int enemy) {
  
    enemies.remove(enemy);
  
  }
  
  int getChestsSize() {
  
    return chests.size();
  
  }
  
  Chest getChest(int i) {
  
    return chests.get(i);
  
  }
  
  float getChestX(int i) {
  
    return chests.get(i).chestX;
    
  }
  
  float getChestY(int i) {
  
    return chests.get(i).chestY;
    
  }
  
  void removeChest(int i) {
  
    chests.remove(i);
  
  }
  
  void change_dx(int i) {
  
    // Firstly, retrieve the correct instance from the array list.
    
    // Then, get the dx value of the instance with downcasting and accessing
    // the required function of the class, then change it and set it with
    // the set_dx procedure.
    
    // This allows lvl 2 enemies to bounce off the side walls.
    
      if (enemies.get(i) instanceof Enemy2) {
      
        int new_dx = ((Enemy2) enemies.get(i)).get_dx() * -1;
        ((Enemy2) enemies.get(i)).set_dx(new_dx);
        
      }
  
  }
  
  color getBG() {
  
    return bg;
  
  }
  
  boolean getIntroCompleted() {
  
    return introCompleted;
  
  }
  
  void setIntroCompleted(boolean setIntro) {
  
    introCompleted = setIntro;
  
  }
  
  // The drawEnemy() procedure looks at the levelNumber variable and draws an enemy depending
  // on what level the user is currently on.
  
  void drawEnemy() {
    
    switch (levelNumber) {
    
      case 1: {
        
          int spawnChance = int(random(1, 26)); // An enemy will have a 1/25 chance of being created.
                
            if (spawnChance == 1) {
              
              enemies.add(new Enemy1(random(32, width - 64), height - 64, 5.0, 10));
                
            }
            
              for(int i = enemies.size() - 1; i >= 0; i--) {
                
                enemies.get(i).updateEnemy();
              
          }
      
      break;
    
    }
      
    case 2:  {
      
        int spawnChance = int(random(1, 26)); // An enemy will have a 1/25 chance of being made.
      
          if (spawnChance == 1) {
            
            enemies.add(new Enemy2(random(32, width - 64), height - 64, 4.0, 20, int(random(3))));
      
          }
    
            for(int i = enemies.size() - 1; i >= 0; i--) {
              
              enemies.get(i).updateEnemy();
            
        }
      
      break;
    
      }
    
    }
  
  }
  
  // The generateChest() procedure creates instances of chests randomly and then adds them to the chests array list
  // so that they can then be draw to the screen afterwards.
  
  void generateChest() {
  
    int chestSpawnChance = int(random(1, 101)); // (1/100) The chance for a chest to be generated.
    
    if (chestSpawnChance == 1) {
    
      int randomNumber = int(random(50)); //(0 to 49)
      
      if (randomNumber >= 5) {
      
        if ((randomNumber >= 5) && (randomNumber <= 27)) {
          
          chests.add(new RedChest(random(32, width - 64), height - 64, -250));
          
        }
        
        else if ((randomNumber >= 28) && (randomNumber <= 49)) {
        
          chests.add(new BlueChest(random(32, width - 64), height - 64, 250));
        
        }
 
      }
      
      else if (randomNumber <= 4) {
      
        chests.add(new WhiteChest(random(32, width - 64), height - 64));
        
      }
    
    }
    
    for(int i = chests.size() - 1; i >= 0; i--) {
            
             chests.get(i).displayChest();
             chests.get(i).moveChest();
              
           }
    
  }
  
  // Updates the key information to bedisplayed on the screen to the user whilst also removing an enemy.
  
  void updateEnemyCount(int enemy) {
  
    removeEnemy(enemy);
    count = count - 1;
    score = score + 100;
    enemiesRemaining = "Enemy Count: " + count;
    playerScore = "Score: " + score;
    
  }
  
  // Resets all the key variables in the class.
  
  void reset() {
  
    levelNumber = 1;
    count = 20;
    score = 0;
    enemiesRemaining = "Enemy Count: " + count;
    playerScore = "Score: " + score;
    bg = color(33, 150, 243);
    enemies.clear();
    chests.clear();
  
  }
  
  // Checks to see if the user is ready to move to the next level, if so then key variables are altered.
  
  void nextLevel() {
  
    enemies.clear();
    chests.clear();
    levelNumber++;
    
    switch (levelNumber) {
    
      case 2:
      
      count = 25;
      enemiesRemaining = "Enemy Count: " + count;
      levelTitle = "Level 2: Mesopelagic Zone";
      bg = color(28, 125, 201);
      break;
      
      }
  
  }
  
}
