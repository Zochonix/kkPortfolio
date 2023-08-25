class Enemy {

  // This class will be used to set up the properties of each enemy that will be inherited.
  
  protected float enemyX;
  protected float enemyY;
  protected float enemySpeed;
  protected int enemyHealth;
  
  // Setup the constructor.
  
  Enemy(float enemyX, float enemyY, float enemySpeed, int enemyHealth) {
  
    this.enemyX = enemyX;
    this.enemyY = enemyY;
    this.enemySpeed = enemySpeed;
    this.enemyHealth = enemyHealth;
    
  }
  
  // the updateEnemy() procedure will initially display an enemy and then move it up the screen.
  
  void updateEnemy() {
  
    displayEnemy();
    moveEnemy();
  
  }
  
  void displayEnemy() {
  
    // This method wil be overriden by each enemy class.
  
  }
  
  // Move the enemy up the screen.
  
  void moveEnemy() {
    
    enemyY -= enemySpeed;
    
  }
  
}
