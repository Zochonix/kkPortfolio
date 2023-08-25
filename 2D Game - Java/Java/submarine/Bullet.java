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

public class Bullet {

    private float bulletX, bulletY;
    private float bulletSpeed = 10.0f;
    private int bulletDamage;
    private BufferedImage bullet;
    
    // Create the constructor.
    
    public Bullet(float x, float y, int bulletDamage) {
    
      this.bulletX = x + 16; // Alter the values so that the bullet always appears in front of the submarine.
      this.bulletY = y + 48;
      this.bulletDamage = bulletDamage;

      try {

        bullet = ImageIO.read(new File("graphics/Bullet/submarine_bullet_32.png"));

    }

    catch (IOException e) {}
      
    }
    
    public float getBulletX() {

        return bulletX;

    }

    public float getBulletY() {

        return bulletY;

    }

    public int getBulletDamage() {

        return bulletDamage;

    }
    
    // Display the bullet (torpedo).
    
    public void draw(Graphics g) {
    
      g.drawImage(bullet, (int) bulletX, (int) bulletY, null);
      move();
    
    }
    
    // Move the bullet (torpedo).
    
    public void move() {
          
      bulletY += bulletSpeed;
    
    }
    
}
