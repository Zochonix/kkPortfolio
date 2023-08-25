// The Chest class, is only a base class, it acts as the super
// class to each of the different Chest classes and is used to make
// the Chest array list in the Level class, therefore there is no need
// for an extends keyword.

class Chest {

  // Define common chest properties.
  
  protected float chestX, chestY;
  
  // Declare the constructor.
  
  Chest(float chestX, float chestY) {
  
    this.chestX = chestX;
    this.chestY = chestY;
  
  }
  
  // Display the chest
  
  void displayChest() {
  
    // This method wil be overriden by each chest class.
  
  }
  
  // Move the chest.
  
  void moveChest() {
    
    chestY -= 4.0;
    
  }

}
