// The RedChest class inherits from Chest
// as it IS-A chest, so the class is extended from Chest.

class RedChest extends Chest {

  // Set the unique design field.
  
  private PImage redChestDesign = loadImage("redchest.png");
  private int value;
  
  // Set the constructor.
  
  RedChest(float chestX, float chestY, int value) {
  
    super(chestX, chestY);
    this.value = value;
  
  }
  
  // The displayChest method is overridden
  // because I want to display the custom image
  // that I made for rlue chests each time an instance of
  // this class is created.
  
  @ Override
  void displayChest() {
  
    image(redChestDesign, chestX, chestY);
    
  }
  
  int getValue() {
  
    return value;
  
  }

}
