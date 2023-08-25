package enemies;

import java.awt.image.BufferedImage;
import javax.imageio.*;
import java.io.*;
import java.awt.Graphics;

public class Gronkzoid extends Enemy {

    private BufferedImage[] animation = new BufferedImage[2];
    private int imageSelector = 0; 
    private int imageCount = 0;

    public Gronkzoid(float enemyX,
    float enemyY,
    float enemySpeed,
    int enemyHealth) {

        super(enemyX, enemyY, enemySpeed, enemyHealth);

        try {

            for (int i = 0; i < 2; i++) {

                if (i == 0) {

                    animation[i] = ImageIO.read(
                        new File(
                            "graphics/Enemies/enemy1_64.png"));

                }

                else if (i == 1) {

                    animation[i] = ImageIO.read(
                        new File(
                            "graphics/Enemies/enemy1_64_down.png"));

                }

            }

        }

        catch (IOException e) {}

    }

    @Override
    protected void displayEnemy(Graphics g) {
    
        if (imageCount == 0) {
        
            if (imageSelector == 0) {
            
                g.drawImage(animation[imageSelector], (int) enemyX, (int) enemyY, null);
                imageSelector++;
                
            }
            
            else if (imageSelector == 1) {
                
                g.drawImage(animation[imageSelector], (int) enemyX, (int) enemyY, null);
                imageSelector--;
                
            }
        
        }
        
        imageCount++;
        g.drawImage(animation[imageSelector], (int) enemyX, (int) enemyY, null); 
        
        if (imageCount == 10) {
        
            imageCount = 0;
        
        }
      
    }
    
}
