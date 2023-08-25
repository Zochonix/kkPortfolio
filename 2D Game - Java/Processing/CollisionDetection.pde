// The CollisionDetection class will contain methods that
// will be called by Xenalysio to detect whether there has been
// a collision between certain objects.

class CollisionDetection {
  
  // Specify a default constructor.
  
  CollisionDetection() {}
  
  // For the methods in this class to work, it has to receive X and Y coordinate values
  // of each of the objects for which it is checking collision.
  
  // Check to see if the bubble has gone past the top of the screen.
  
  boolean bubbleBorderCheck(float bubbleY) {
  
    if (bubbleY < 0) {
      
      return true;
      
    }
    
    else {
      
      return false;
      
    }
  
  }
  
  // Determine whether the player has come into contact with a border or not.
  
  float[] checkBorderCollision(float playerX, float playerY) {
  
    float[] submarine_values = new float[2]; // We have to return multiple values.
    
    submarine_values[0] = playerX;
    submarine_values[1] = playerY;
    
    // Left Upper Corner
    
    if (playerX < 0 && playerY < 0) {

      submarine_values[0] = 0;
      submarine_values[1] = 0;
      
      return submarine_values;
      
    }
    
    // Right Upper Corner
    
    else if (playerX > width - 65 && playerY < 0) {

      submarine_values[0] = width - 65;
      submarine_values[1] = 0;
      
      return submarine_values;
      
    }
    
    // Bottom Left Corner
    
    else if (playerX < 0 && playerY > height - 64) {

      submarine_values[0] = 0;
      submarine_values[1] = height - 64;
      
      return submarine_values;
      
    }
    
    // Bottom Right Corner
    
    else if (playerX > width - 64 && playerY > height - 64) {

      submarine_values[0] = width - 64;
      submarine_values[1] = height - 64;
      
      return submarine_values;
      
    }
    
    // Left Wall
    
    else if (playerX < 0) {
    
      submarine_values[0] = 0;
      
      return submarine_values;
    
    }
    
    // Right Wall
    
    else if (playerX >= width - 58) {

      submarine_values[0] = width - 58;
      
      return submarine_values;
      
    }
    
    // Top Wall
    
    else if (playerY < 0) {

      submarine_values[1] = 0;
      
      return submarine_values;
      
    }
    
    // Bottom Wall
    
    else if (playerY >= height - 64) {

      submarine_values[1] = height - 64;
      
      return submarine_values;
      
    }
    
    else {
    
      return submarine_values;
    
    }
    
  }
  
  // Determine if a player has collided with an enemy.
  
  boolean playerCollidesWithEnemy(float playerX, float playerY, float enemyX, float enemyY) {
    
    if (playerX + 64 >= enemyX && playerX <= enemyX + 64 && playerY + 64 >= enemyY && enemyY <= enemyY + 64) {
      
      return true;

    }
    
    else {
    
      return false;
    
    }
    
  }
  
  // Determine if the player has collided with a chest.
  
  boolean playerCollidesWithChest(float chestX, float chestY, float playerX, float playerY) {
  
    if (playerX + 64 >= chestX && playerX <= chestX + 44 && playerY + 64 >= chestY && playerY <= chestY + 34) {
      
      return true;

    }
    
    return false;
  
  }
  
  // Determine is a bullet has hit an enemy or not.
  
  boolean bulletHitsEnemy(float bulletX, float bulletY, float enemyX, float enemyY) {
  
    if (bulletX + 32 >= enemyX && bulletX <= enemyX + 64 && bulletY + 32 >= enemyY && bulletY <= enemyY + 64) {
      
      return true;

    }
    
    else {
    
      return false;
    
    }
  
  }
  
  // Determine if a bullet has gone past the bottom of the screen or not.
  
  boolean bulletBorderCheck(float bulletY) {
  
    if (bulletY > height) {
      
      return true;
      
    }
    
    else {
      
      return false;
      
    }
  
  }
  
  // Determine if an enemy has hit the top of the program or not.
  
  boolean enemyHitsTop(float enemyY) {
  
    if (enemyY < 0) {
      
      return true;
      
    }
    
    return false;
    
  }
  
  // Determine if an enemy has hit the side walls or not.
  
  boolean enemyHitsSide(float enemyX) {
  
    if (enemyX < 0 || enemyX >= width - 64) {
      
      return true;
      
    }
    
    return false;
    
  }
  
}
