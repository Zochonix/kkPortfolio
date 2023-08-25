package submarine;
/*
 *
 * Author: Kane Kennedy
 * Last Modified: 25/05/23
 * 
 */

import java.awt.image.BufferedImage;
import javax.imageio.*;
import java.io.*;
import java.awt.Graphics;

public class Bubble {

    private float bubbleX, bubbleY;
    private float bubbleSpeed = 2.5f;
    private BufferedImage bubble;

    public Bubble(float x, float y) {

        // Alter the values so that the bubble always appears behind the submarine.
  
        this.bubbleX = x + 24; 
        this.bubbleY = y - 20;

        try {

            bubble = ImageIO.read(new File("graphics/Bubble/bubble_16.png"));

        }

        catch (IOException e) {}
        
    }

    public float getBubbleY() {

        return bubbleY;

    }

    // Move the bubble.
    
    public void move() {
        
        bubbleY -= bubbleSpeed;
    
    }
      
    // Display the bubble.
    
    public void draw(Graphics g) {

        g.drawImage(bubble,(int) bubbleX,(int) bubbleY, null);
        move();

    }
    
}
