// Firstly, it's important to make it clear that BlueChest inherits from Chest
// as it IS-A chest, so the class is extended from Chest.

class BlueChest extends Chest {

  // Set the distinct image of the chest.
  
  private PImage blueChestDesign = loadImage("bluechest.png");
  private int value;
  
  // Call the constructor
  BlueChest(float chestX, float chestY, int value) {
  
    // Inherits the values from the super constructor.
    super(chestX, chestY);
    this.value = value;
  
  }
  
  // Now, the displayChest method is overridden
  // because I want to display the custom image
  // that I made for blue chests each time an instance of
  // this class is created.
  
  @ Override
  void displayChest() {
  
    image(blueChestDesign, chestX, chestY);
    
  }
  
  int getValue() {
  
    return value;
  
  }

}
