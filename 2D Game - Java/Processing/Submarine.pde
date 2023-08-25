// The Submarine class represents the main player. It is used to
// store and control the properties (fields) of the submarine
// as well as methods which act upon those properties.

class Submarine {

  // Firstly, we define the fields for the class.

  private float x, y; //These variables will define the submarine's position on the screen.
  private float dx, dy; // These variables will store the difference in x and y.
  private float speedX = 5.0; //These variables will define the speed at which the submarine is moving.
  private float speedY = 5.0;
  private ArrayList<Bullet> bullets = new ArrayList<Bullet>(); // Create an Array List to hold the number of bullets to be fired (number of Bullet instances (objects).)
  private ArrayList<Bubble> bubbles = new ArrayList<Bubble>(); // Create an Array List to hold the number of bubbles that the submarine will release.
  private PImage subImage = loadImage("submarine_64.png"); // This constant will hold the image (the image path) for the submarine.
  private int bubbleCounter = 0; // This bubble counter will be used to control the number of bubbles that appear on the screen
  private int bulletCount = 0; // This counter is used to control how many higher damage bullets get fired.
  private int submarineHealth = 250; // The health of the main player.
  private int shield = 0; // The player's shield health.
  private boolean hasHigherDamage = false; // The variable that determines whether the submarine should be firing bullets (torpedos) with hgiher damage or not.
  
  // Setup the constructor.

  Submarine(float x, float y) {

    this.x = x;
    this.y = y;
    
  }
  
  // Getters and Setters
  
  float getSubmarineX() {
  
    return x;
  
  }
  
  void setSubmarineX(float new_x) {
  
    x = new_x;
  
  }
  
  float getSubmarineY() {
  
    return y;
  
  }
  
  void setSubmarineY(float new_y) {
  
    y = new_y;
  
  }
  
  int getBulletsSize() {
  
    return bullets.size();
  
  }
  
  float getBulletX(int i) {
  
    return bullets.get(i).bulletX;
  
  }
  
  float getBulletY(int i) {
  
    return bullets.get(i).bulletY;
  
  }
  
  int getBulletDamage(int i) {
  
    return bullets.get(i).bulletDamage;
  
  }
  
  // Removes a bullet from the array list.
  
  void removeBullet(int bullet) {
  
    bullets.remove(bullet);
    
  }
  
  void clearBullets() {
  
    bullets.clear();
    
  }
  
  int getBubblesSize() {
  
    return bubbles.size();
  
  }
  
  float getBubbleY(int i) {
  
    return bubbles.get(i).bubbleY;
  
  }
  
  void removeBubble(int i) {
  
    bubbles.remove(i);
  
  }
  
  int getSubmarineHealth() {
  
    return submarineHealth;
  
  }
  
  int getShield() {
  
    return shield;
  
  }

  // Displays the submarine at specified X and Y coordinates.
  // If the gameState is active then the generateBubble()
  // procedure is called which will begin to generate bubbles
  // from the back of the submarine.
  
  // The update() procedure will also be called which will
  // constantly update the player's position on the screen
  // with reference to what arrow keys are being pressed
  // or not.

  void display(gameState state) {

    if (state == gameState.INITIAL) {

      image(subImage, x, y);
      
    }
    
    else if (state == gameState.ACTIVE) {
      
      generateBubble();
      image(subImage, x, y);
      update();
      
    }
    
  }
  
  // Generates bubbles and uses a counter to control the flow of the bubbles.

  void generateBubble() {
  
    if (bubbleCounter == 0) {
        
        bubbles.add(new Bubble(x, y));
        bubbleCounter++;
        
      }
      
      else if (bubbleCounter != 0 && bubbleCounter != 10) {
      
        bubbleCounter++;
      
      }
        
      else if (bubbleCounter == 10) {
        
        bubbleCounter = 0;
        
      }
    
  }
  
  // Updates the position of the submarine on the screen as the bubbles and bullets.

  void update() {

    x += dx * speedX;
    y += dy * speedY; // Here is where we change the position of the submarine for the next display call.

    if (dy == 0) {

      y += 2; // This will give the 'falling' effect (goes to the bottom because we're underwater and descending (gravity.).)
      
    }
    
    // Loop through both array lists and call the respective update procedures.
    
    for(int i = bubbles.size() - 1; i >= 0; i--) {
        
      bubbles.get(i).update();
        
    }
      
   for(int i = bullets.size() - 1; i >= 0; i--) {
        
       bullets.get(i).update();
          
    }
      
  }
  
  // Change the dx and dy variables depending on what key is being pressed.

  void move(boolean left, boolean right, boolean up, boolean down) {

    if (left)  dx = -1;
    if (right) dx =  1;
    if (up)    dy = -1;
    if (down)  dy =  1;
    
  }
  
  // Set dx and dy to 0 when no key is being pressed.

  void endMovement(boolean left, boolean right, boolean up, boolean down) {

    if (left)  dx = 0;
    if (right) dx = 0;
    if (up)    dy = 0;
    if (down)  dy = 0;
    
  }
  
  // Creates a bullet when f/F gets pressed.
  
  // if hasHigherDamage is true then an instance
  // with higher damage is created instead.
  
  void createBullet(boolean createBullet) {
    
    if (createBullet) {
      
      if (hasHigherDamage == true) {
      
        bullets.add(new Bullet(x, y, 20));
        bulletCount++;
        
        if (bulletCount == 10) {
        
          hasHigherDamage = false;
          
        }
      
      }
      
      else {
      
        bullets.add(new Bullet(x, y, 10));
      
      }
      
    }
    
  }
  
  // Decreases the health of the submarine.
  
  // If the player has a shield, then the
  // health of the shield gets decreased instead.
  
  void decreaseHealth() {
  
    if (shield != 0) {
    
      shield = shield - 50;
    
    }
    
    else {
    
    submarineHealth = submarineHealth - 50;
    
    }
    
  }
  
  // Resets all the key variables in the submarine class.
  
  void reset() {
  
    x = width / 2 - 32;
    y = height / 2;
    bullets.clear();
    bubbles.clear();
    bubbleCounter = 0;
    submarineHealth = 250;
    shield = 0;
  
  }
  
  // Sets hasHigherDamage to true.
  
  void activateHigherDamage() {
  
    hasHigherDamage = true;
  
  }
  
  // Sets the value of the shield variable to 250
  
  void activateShield() {
  
    shield = 250;
  
  }
  
  // Refills the health of the submarine.
  
  void refillHealth() {
  
    submarineHealth = 250;
    
  }
  
}
