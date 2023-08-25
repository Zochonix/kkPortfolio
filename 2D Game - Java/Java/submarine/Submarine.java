package submarine;
/*
 *
 * Author: Kane Kennedy
 * Last Modified: 25/05/23
 * 
 */

import java.util.ArrayList;
import java.awt.image.BufferedImage;
import javax.imageio.*;
import java.io.*;
import java.awt.Graphics;
import utility.KeyController;

public class Submarine {

    private float x, y;
    private float speed;
    private int health;
    private BufferedImage submarine;
    private ArrayList<Bullet> bullets = new ArrayList<Bullet>();
    private ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
    private int bulletCount = 0;
    private int bubbleCounter = 0;

    private KeyController keyHandler;

    public Submarine(float x, float y, KeyController keyHandler) {

        this.x = x;
        this.y = y;
        this.speed = 10.0f;
        this.health = 50;
        this.keyHandler = keyHandler;

        try {

            submarine = ImageIO.read(new File("graphics/Submarine/submarine_64.png"));

        }

        catch (IOException e) {}
        
    }

    public float getSubmarineX() {
  
        return x;
      
    }

    public float getSubmarineY() {
      
        return y;
      
    }
      
    public int getHealth() {

        return health;

    }
    
    public void setSubmarineX(float new_x) {
      
        x = new_x;
      
    }

    public void setSubmarineY(float new_y) {
  
        y = new_y;
      
    }

    public void setHealth(int newHealth) {

        this.health = newHealth;

    }
    
    public int getBulletsSize() {
  
        return bullets.size();
      
    }
      
    public float getBulletX(int i) {
    
        return bullets.get(i).getBulletX();
    
    }
      
    public float getBulletY(int i) {
    
        return bullets.get(i).getBulletY();
    
    }
      
    public int getBulletDamage(int i) {
    
        return bullets.get(i).getBulletDamage();
    
    }
      
    // Removes a bullet from the array list.
    
    public void removeBullet(int bullet) {
    
        bullets.remove(bullet);
    
    }
    
    public void createBullet() {
          
        bullets.add(new Bullet(x, y, 10));
        
    }
    
    public int getBubblesSize() {
  
        return bubbles.size();
      
    }
    
    public float getBubbleY(int i) {
  
        return bubbles.get(i).getBubbleY();
      
    }
      
    public void removeBubble(int i) {
      
        bubbles.remove(i);
      
    }

    public void reset(int width, int height) {

        setSubmarineX((width / 2) - 32);
        setSubmarineY((height / 2) - 32);
        setHealth(50);
        bullets.clear();
        bubbles.clear();

    }
    
    public void update() {

        if (keyHandler.upPressed) {
            setSubmarineY(getSubmarineY() - speed);}
        if (keyHandler.bottomPressed) {
            setSubmarineY(getSubmarineY() + speed);}
        if (keyHandler.leftPressed) {
            setSubmarineX(getSubmarineX() - speed);}
        if (keyHandler.rightPressed) {
            setSubmarineX(getSubmarineX() + speed);}
        if (keyHandler.fireBullet && bulletCount == 0) {createBullet(); bulletCount++;}
        if (!keyHandler.fireBullet) {bulletCount = 0;}

    }
    
    private void generateBubble() {
  
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
    
    public void draw(Graphics g) {

        generateBubble();
        g.drawImage(submarine,(int) x,(int) y, null);

        for (int i = bubbles.size() - 1; i >= 0; i--) {
    
            bubbles.get(i).draw(g);
                
        }

        for (int i = bullets.size() - 1; i >= 0; i--) {
        
            bullets.get(i).draw(g);
               
         }

    }
    
}
