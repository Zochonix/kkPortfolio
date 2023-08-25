package enemies;

import java.awt.image.BufferedImage;
import javax.imageio.*;
import java.io.*;
import java.awt.Graphics;

public class Zuxa extends Enemy {

    private BufferedImage design;

    public Zuxa(float enemyX,
    float enemyY,
    float enemySpeed,
    int enemyHealth) {

        super(enemyX, enemyY, enemySpeed, enemyHealth);

        try {

            design = ImageIO.read(
                new File("graphics/Enemies/enemy2_64.png"));

        }

        catch (IOException e) {}

    }

    @Override
    protected void displayEnemy(Graphics g) {
    
        g.drawImage(design, (int) enemyX, (int) enemyY, null); 
      
    }
    
}
