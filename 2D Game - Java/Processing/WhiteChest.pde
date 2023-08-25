// The WhiteChest class inherits from Chest
// as it IS-A chest, so the class is extended from Chest.

class WhiteChest extends Chest {

  // Set a distinct image to be used when a chest is generated.
  
  private PImage whiteChestDesign = loadImage("whitechest.png");
  
  // Set the constructor.
  
  WhiteChest(float chestX, float chestY) {
  
    super(chestX, chestY);
  
  }
  
  // Now, the displayChest method is overridden
  // because I want to display the custom image
  // that I made for white chests each time an instance of
  // this class is created.
  
  @ Override
  void displayChest() {
  
    image(whiteChestDesign, chestX, chestY);
    
  }

}
