// The Submarine class and the Bubble class have a HAS-A relationship and
// therefore, there is no need for the extends keyword as we will instead
// create an instance of the Bubble class in Submarine (use composition).

class Bubble {

  // This class will be used to handle the properties of each bubble
  // that's released from the back of the submarine.
  
  // Firstly, define the properties that each bubble will have.
  
  private float bubbleX, bubbleY;
  private float bubbleSpeed = 2.5;
  private PImage bubble = loadImage("bubble_16.png");
  
  // Then create the constructor.
  
  Bubble(float x, float y) {
  
    this.bubbleX = x + 24; // Alter the values so that the bubble always appears behind the submarine.
    this.bubbleY = y - 20;
    
  }
  
  // Create an update method, which when called will display and mvoe the bubble.
  
  void update() {
    
    render();
    move();
  
  }
  
  // Display the bubble.
  
  void render() {
     
    image(bubble, bubbleX, bubbleY);
  
  }
  
  // Move the bubble.
  
  void move() {
        
    bubbleY -= bubbleSpeed;
  
  }

}
