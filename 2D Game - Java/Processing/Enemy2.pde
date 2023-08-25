// The Enemy2 class represents each enemy that will be created
// fior the second level, and since it is an enemy, it has a
// IS-A relationship with the Enemy class, so the class uses the
// extends keyword to represent inheritance.

class Enemy2 extends Enemy {

  // Setup the fields of the class.
  
  private PImage enemyDesign = loadImage("enemy2_64.png");
  private int dx = 1;
  private int wackyMovement;
  
  // Setup the constructor.
  
  Enemy2(float enemyX, float enemyY, float enemySpeed, int enemyHealth, int wackyMovement) {
  
    super(enemyX, enemyY, enemySpeed, enemyHealth);
    this.wackyMovement = wackyMovement;
  
  }
  
  // Like the Enemy1 class, we also override
  // the displayEnemy procedure in this class too.
  
  @ Override
  void displayEnemy() {
  
    image(enemyDesign, enemyX, enemyY);
    
  }
  
  // We will also override the moveEnemy procedure here too
  // because we want to make enemies move left and right
  // as well as up the screen.
  
  @ Override
  void moveEnemy() {
    
    if (wackyMovement == 1) {
      
      enemySpeed = 7.0;
      enemyX = enemyX + enemySpeed * dx;
      
    }
    
    else if (wackyMovement == 2) {
      
      enemySpeed = 7.0;
      enemyX = enemyX - enemySpeed * dx;
      
    }
    
    super.moveEnemy();
    
  }
  
  int get_dx() {
  
    return dx;
  
  }
  
  void set_dx(int new_dx) {
  
    dx = new_dx;
  
  }

}
