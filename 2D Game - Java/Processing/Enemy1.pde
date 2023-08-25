// The Enemy1 class represent each enemy that will be created
// fior the first level, and since it is an enemy, it has a
// IS-A relationship with the Enemy class, so the class uses the
// extends keyword to represent inheritance.

class Enemy1 extends Enemy {
  
  // Set the fields for the class.
  
  private PImage enemyDesign = loadImage("enemy1_64.png");
  private PImage enemyAltDesign = loadImage("enemy1_64_down.png");
  private PImage currentDesign; // Alternate between each image for an animated effect.
  private int imageSelector = 1; 
  private int imageCount = 0;
  
  // Setup the constructor.
  
  Enemy1(float enemyX, float enemyY, float enemySpeed, int enemyHealth) {
    
    super(enemyX, enemyY, enemySpeed, enemyHealth);
  
  }
  
  // The displayEnemy() procedure is overridden because
  // we are displaying the enemy with an image that is
  // unique to this class.
  
  @ Override
  void displayEnemy() {
    
    // Use a counter to control the rate of change
    // and a selector to determine which image
    // will be drawn.
    
    if (imageCount == 0) {
      
      if (imageSelector == 1) {
      
        currentDesign = enemyDesign;
        image(enemyDesign, enemyX, enemyY);
        imageSelector++;
        
      }
        
      else if (imageSelector == 2) {
        
        currentDesign = enemyAltDesign;
        image(enemyAltDesign, enemyX, enemyY);
        imageSelector--;
        
      }
    
    }
    
    imageCount++;
    image(currentDesign, enemyX, enemyY); 
    
    if (imageCount == 10) {
    
      imageCount = 0;
    
    }
      
  }
  
}
