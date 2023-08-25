// Like the Bubble class, the Submarine class and the
// Bullet class have a HAS-A relationship and therefore,
// there is no need for the extends keyword.

class Bullet {

  // This class will be used to handle the properties of each bullet (torpedo)
  // that gets fired from the submarine.
  
  // Firstly the class needs to have it's own properties, so
  // we ensure that the bullet (torpedo) actually has an image
  // that can represent itself along with a speed value and X and Y coordinates.
  
  private float bulletX, bulletY;
  private float bulletSpeed = 10.0;
  private int bulletDamage;
  private PImage bullet = loadImage("submarine_bullet_32.png");
  
  // Create the constructor.
  
  Bullet(float x, float y, int bulletDamage) {
  
    this.bulletX = x + 16; // Alter the values so that the bullet always appears in front of the submarine.
    this.bulletY = y + 48;
    this.bulletDamage = bulletDamage;
    
  }
  
  // Update() will call both render() and move(), thus displaying the bullet on the screen
  // and moving it downward
  
  void update() {
    
    render();
    move();
  
  }
  
  // Display the bullet (torpedo).
  
  void render() {
  
    image(bullet, bulletX, bulletY);
  
  }
  
  // Move the bullet (torpedo).
  
  void move() {
        
    bulletY += bulletSpeed;
  
  }

}
