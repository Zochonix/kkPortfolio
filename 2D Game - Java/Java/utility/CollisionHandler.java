package utility;
/*
 *
 * Author: Kane Kennedy
 * Last Modified: 25/05/23
 * 
 */

public class CollisionHandler {

    public boolean bubbleBorderCheck(float bubbleY) {
  
        if (bubbleY < 0) {
            
            return true;
            
        }
        
        else {
            
            return false;
            
        }
      
    }
      
    public float[] checkBorderCollision(
        float playerX,
        float playerY,
        int width,
        int height) {
  
        float[] submarine_values = new float[2];
        
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

    public boolean playerCollidesWithEnemy(
        float playerX,
        float playerY,
        float enemyX,
        float enemyY) {
    
        if (
            playerX + 64 >= enemyX &&
            playerX <= enemyX + 64 &&
            playerY + 64 >= enemyY &&
            enemyY <= enemyY + 64
            ) {
          
            return true;
    
        }
        
        else {
        
            return false;
        
        }
        
    }

    public boolean bulletHitsEnemy(float bulletX,
    float bulletY,
    float enemyX,
    float enemyY) {
  
        if (bulletX + 32 >= enemyX &&
        bulletX <= enemyX + 64 &&
        bulletY + 32 >= enemyY &&
            bulletY <= enemyY + 64) {
          
            return true;
    
        }
        
        else {
        
            return false;
        
        }
      
    }

    public boolean bulletBorderCheck(float bulletY, int height) {
  
        if (bulletY > height) {
          
            return true;
          
        }
        
        else {
          
            return false;
          
        }
      
    }

    public boolean enemyHitsTop(float enemyY) {
  
        if (enemyY < 0) {

            return true;

        }

        return false;

    }
    
}
