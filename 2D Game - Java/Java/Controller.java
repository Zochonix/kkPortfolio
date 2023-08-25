/*
 *
 * Author: Kane Kennedy
 * Last Modified: 26/05/23
 * 
 */

// System Imports

import javax.swing.JPanel;
import java.util.ArrayList;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
// Font Aliasing
import java.awt.RenderingHints;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.util.Random;
import java.util.stream.IntStream;
import java.awt.image.BufferedImage;
import javax.imageio.*;
import java.io.*;

// User Imports

import submarine.Submarine;
import enemies.*;
import utility.CollisionHandler;
import utility.KeyController;

public class Controller extends JPanel implements Runnable {

    /* State Control */
    
    private gameState state;
    private enum gameState {
        
        START,
        ACTIVE, 
        PAUSE,
        GAME_OVER
    
    }

    /* UI Stuff */

    private final int SCREEN_WIDTH = 1280;
    private final int SCREEN_HEIGHT = 720;
    private Boolean hasTitleScreenResources = false;
    private Boolean hasBGChanged = false;
    private BufferedImage titleText = null;
    private BufferedImage titleText_sub = null;
    private BufferedImage continueText = null;
    private int score = 0;

    /* Class Instances */

    private Submarine submarine;
    private CollisionHandler collisionHandler;
    private Random randomNumber;
    private ArrayList<Enemy> enemies = new ArrayList<Enemy>();

    /* Low-level Stuff */
    
    private Thread thread;
    private KeyController keyHandler = new KeyController();

    public Controller() {

        setPreferredSize(new Dimension(SCREEN_WIDTH, SCREEN_HEIGHT));
        createInstances();
        addKeyListener(keyHandler);
        setFocusable(true);
        createThread();

    }

    private void createInstances() {

        state = gameState.START;
        submarine = new Submarine(
            (SCREEN_WIDTH / 2) - 32,
            (SCREEN_HEIGHT / 2) - 32,
            keyHandler
            );
        collisionHandler = new CollisionHandler();
        randomNumber = new Random();

    }

    private void createThread() {

        thread = new Thread(this);
        thread.start();

    }

    private int generateRandomNumber(String identifier) {

        IntStream generator;
        int[] generatorArray;
        int returnValue;

        if (identifier.equals("Gronkzoid")) {

            generator = randomNumber.ints(1, 1, 26); // 1 ... 25, will spawn if 1 is selected.
            generatorArray = generator.toArray();
            returnValue = generatorArray[0];
            return returnValue;

        }

        if (identifier.equals("Zuxa")) {

            generator = randomNumber.ints(1, 1, 1001); // 1 ... 25, will spawn if 1 is selected.
            generatorArray = generator.toArray();
            returnValue = generatorArray[0];
            return returnValue;

        }

        if (identifier.equals("MonsterX")) {

            generator = randomNumber.ints(1, 32, (SCREEN_WIDTH - 64));
            generatorArray = generator.toArray();
            returnValue = generatorArray[0];
            return returnValue;

        }

        return 0;

    }
    
    private void drawEnemy(String identifier) {

        if (identifier.equals("Gronkzoid")) {

            int spawnChance = generateRandomNumber("Gronkzoid");

            if (spawnChance == 1) {

                int xLocation = generateRandomNumber("MonsterX");
                
                enemies.add(new Gronkzoid(xLocation, SCREEN_HEIGHT - 64, 5.0f, 10));
                
            }

        }

        if (identifier.equals("Zuxa")) {

            int spawnChance = generateRandomNumber("Zuxa");

            if (spawnChance == 1) {

                int xLocation = generateRandomNumber("MonsterX");
                
                enemies.add(new Zuxa(xLocation, SCREEN_HEIGHT - 64, 2.5f, 30));
                
            }

        }

    }

    // COLLISION HANDLERS - START
    
    private void checkBubbleBorder() {

        for (int i = submarine.getBubblesSize() - 1; i >= 0; i--) {
        
          float bubbleY = submarine.getBubbleY(i);
        
            if (collisionHandler.bubbleBorderCheck(bubbleY) == true) {
            
              submarine.removeBubble(i);
              
            }
        
        }
      
    }
    
    private void checkPlayerBorder() {

        float[] new_values = collisionHandler.checkBorderCollision(
            submarine.getSubmarineX(),
            submarine.getSubmarineY(),
            SCREEN_WIDTH,
            SCREEN_HEIGHT);
  
        submarine.setSubmarineX(new_values[0]);
        submarine.setSubmarineY(new_values[1]);

    }
    
    private void checkPlayerEnemy() {

        for (int i = enemies.size() - 1; i >= 0; i--) { 
        
          float enemyX = enemies.get(i).getEnemyX();
          float enemyY = enemies.get(i).getEnemyY();
          
          if (
            collisionHandler.playerCollidesWithEnemy(
                submarine.getSubmarineX(),
                submarine.getSubmarineY(),
                enemyX,
                enemyY)) {
          
            // If the player has collied with an enemy, remove the enemy and deal damage to the player.
            // If they have a shield then take away shield health instead.
            
            if (enemies.get(i) instanceof Gronkzoid) {

                submarine.setHealth(submarine.getHealth() - 10);
                enemies.remove(i);

            }

            else if (enemies.get(i) instanceof Zuxa) {

                submarine.setHealth(submarine.getHealth() - 20);
                enemies.remove(i);

            }
            
            if (submarine.getHealth() <= 0) {
              
                state = gameState.GAME_OVER;
                keyHandler.setGameOver();
              
            }
            
          }
          
        }
      
      }
    
    private void checkBulletEnemy() {
  
        for (int i = enemies.size() - 1; i >= 0; i--) {
        
            float enemyX = enemies.get(i).getEnemyX();
            float enemyY = enemies.get(i).getEnemyY();
            int enemyHealth = enemies.get(i).getEnemyHealth();
            
            for (int j = submarine.getBulletsSize() - 1; j >= 0; j--) { 
            
                float bulletX = submarine.getBulletX(j);
                float bulletY = submarine.getBulletY(j); 
                int bulletDamage = submarine.getBulletDamage(j); 
                
                if (collisionHandler.bulletHitsEnemy(bulletX,
                bulletY,
                enemyX,
                enemyY)) {
              
                    enemyHealth -= bulletDamage;
                    
                    if (enemyHealth <= 0) {
                    
                        submarine.removeBullet(j);
                        enemies.remove(i);
                        score = score + 10;
                        i--;
                        j--;

                    }

                    else if (enemyHealth != 0) {
          
                        float enemyBounceBack = 25.0f;
                        
                        enemies.get(i).setEnemyHealth(enemyHealth);
                        enemies.get(i).setEnemyY(
                        enemies.get(i).getEnemyY() + enemyBounceBack); 
                        submarine.removeBullet(j);
                        j--;
                        
                    }
                    
                }
            
            }
          
        }
      
    }
    
    private void checkBulletBorder() {

        for(int i = submarine.getBulletsSize() - 1; i >= 0; i--) {
        
          float bulletY = submarine.getBulletY(i);
        
            if (collisionHandler.bulletBorderCheck(bulletY, SCREEN_HEIGHT)) {
            
              submarine.removeBullet(i);
              
            }
        
        }
      
    }
    
    private void checkEnemyBorder() {

        for (int i = enemies.size() - 1; i >= 0; i--) {
    
            float enemyY = enemies.get(i).getEnemyY();
          
            if (collisionHandler.enemyHitsTop(enemyY)) {
            
                enemies.remove(i);
              
            }
          
        }

    }
    
    // COLLISION HANDLERS - END
    
    private void update() {

        // START STATE

        if (state == gameState.START) {

            if (keyHandler.getHasGameStarted()) {

                state = gameState.ACTIVE;
                keyHandler.setHasGameStarted();

            }

        }

        // ACTIVE STATE

        if (state == gameState.ACTIVE) {

            submarine.update();
            drawEnemy("Gronkzoid");
            drawEnemy("Zuxa");
            checkBubbleBorder();
            checkPlayerBorder();
            checkPlayerEnemy();
            checkBulletEnemy();
            checkBulletBorder();
            checkEnemyBorder();

            if (submarine.getHealth() <= 0) {
              
                state = gameState.GAME_OVER;
              
            }

            if (keyHandler.getIsPaused()) {

                state = gameState.PAUSE;

            }

        }

        // PAUSE STATE

        if (state == gameState.PAUSE) {

            if (!keyHandler.getIsPaused()) {

                state = gameState.ACTIVE;

            }

        }

        // GAME OVER STATE

        if (state == gameState.GAME_OVER) {

            if (!keyHandler.getGameOver()) {

                score = 0;
                enemies.clear();
                submarine.reset(SCREEN_WIDTH, SCREEN_HEIGHT);
                state = gameState.ACTIVE;

            }

        }

    }

    @Override
    public void run() {

        double drawInterval = 1000000000/60;
        double nextDrawTime = System.nanoTime() + drawInterval;

        while (thread != null) {

            update();
            repaint();

            try {

                double remainingTime = 
                (nextDrawTime - System.nanoTime()) / 10000000;
                if (remainingTime < 0) {remainingTime = 0;}
                Thread.sleep((long) remainingTime);
                nextDrawTime += drawInterval;

            }

            catch (Exception e) {}

        }

    }

    @Override
    public void paintComponent(Graphics g) {

        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(

            RenderingHints.KEY_TEXT_ANTIALIASING,
            RenderingHints.VALUE_TEXT_ANTIALIAS_GASP

            );

        if (state == gameState.START) {

            if (!hasTitleScreenResources) {
                
                setBackground(new Color(0, 0, 0));

                try {

                    titleText = ImageIO.read(new File("graphics/Text/welcomeText_592.png"));
                    titleText_sub = ImageIO.read(new File("graphics/Text/welcomeText2_128.png"));
                    continueText = ImageIO.read(new File("graphics/Text/continueText_256.png"));
        
                }
        
                catch (IOException e) {}

                hasTitleScreenResources = true;

            }

            int xCenter = SCREEN_WIDTH / 2;

            g.drawImage(
                titleText, 
                xCenter - (titleText.getWidth() / 2),
                (SCREEN_HEIGHT / 2) - titleText.getHeight(),
                null);

            g.drawImage(
                titleText_sub,
                xCenter - (titleText.getWidth() / 2),
                (SCREEN_HEIGHT / 2),
                null);

            g.drawImage(
                continueText,
                xCenter - (continueText.getWidth() / 2),
                ((SCREEN_HEIGHT / 3) * 2) + ((SCREEN_HEIGHT / 3) - ((SCREEN_HEIGHT / 3) / 2)),
                null);

            Font font = new Font("Consolas", 1, 16);
            FontMetrics metrics = g.getFontMetrics(font);
            int hgt = metrics.getHeight();
            int xLocation = 8;
            g.setFont(font);
            g.setColor(Color.WHITE);
            g.drawString(
                "Controls:",
                xLocation,
                hgt);

            g.drawString(
            "Move Submarine: WASD",
            xLocation,
            hgt * 2);

            g.drawString(
            "Fire Torpedo: K",
            xLocation,
            hgt * 3);

            g.drawString(
            "Pause the Game: SPACEBAR",
            xLocation,
            hgt * 4);

            font = new Font("Consolas", 1, 12);
            metrics = g.getFontMetrics(font);
            hgt = metrics.getHeight();
            g.setFont(font);
            g.drawString(
            "Version 0.1",
            0,
            SCREEN_HEIGHT);

        }
        
        else if (state == gameState.ACTIVE) {

            if (!hasBGChanged) {

                setBackground(new Color(33, 150, 243));
                hasBGChanged = true;

            }

            submarine.draw(g);

            for (int i = enemies.size() - 1; i >= 0; i--) {
              
                enemies.get(i).updateEnemy(g);
                
            }

        }

        else if (state == gameState.PAUSE) {
            
            Font font = new Font("Consolas", 1, 20);
            FontMetrics metrics = g.getFontMetrics(font);
            int hgt = metrics.getHeight();
            int width = metrics.stringWidth("Paused");
            g.setFont(font);
            g.setColor(Color.BLACK);
            g.drawString(
                "Paused",
                (SCREEN_WIDTH / 2) - width / 2,
                ((SCREEN_HEIGHT / 3) / 2) - (hgt / 2) + hgt);

            // Display Controls

            /*g.fillRoundRect((SCREEN_WIDTH / 2) - 200, (SCREEN_HEIGHT / 2) - ((hgt * 4) / 2), 400, (hgt * 4) + (hgt / 2), 8, 8);*/
            //g.setColor(Color.DARK_);
            width = metrics.stringWidth("Controls");
            g.drawString("Controls", (SCREEN_WIDTH / 2) - width / 2, (SCREEN_HEIGHT / 2) - ((hgt * 4) / 2) + hgt);
            width = metrics.stringWidth("Submarine Controls: WASD");
            g.drawString("Submarine Controls: WASD", (SCREEN_WIDTH / 2) - width / 2, (SCREEN_HEIGHT / 2) - ((hgt * 4) / 2) + hgt * 2);
            width = metrics.stringWidth("Fire Torpedo: K");
            g.drawString("Fire Torpedo: K", (SCREEN_WIDTH / 2) - width / 2, (SCREEN_HEIGHT / 2) - ((hgt * 4) / 2) + hgt * 3);
            width = metrics.stringWidth("Pause Game: SPACEBAR");
            g.drawString("Pause Game: SPACEBAR", (SCREEN_WIDTH / 2) - width / 2, (SCREEN_HEIGHT / 2) - ((hgt * 4) / 2) + hgt * 4);


        }

        else if (state == gameState.GAME_OVER) {

            Font font = new Font("Consolas", 0, 20);
            FontMetrics metrics = g.getFontMetrics(font);
            int hgt = metrics.getHeight();
            int width = metrics.stringWidth("Game Over. Your final score was " + score + ".");
            g.setFont(font);
            g.setColor(Color.BLACK);
            g.drawString(
                "Game Over. Your final score was " + score + ".",
                (SCREEN_WIDTH / 2) - width / 2,
                (SCREEN_HEIGHT / 2) + hgt - (hgt / 2));
            width = metrics.stringWidth("Press the \"C\" key to play again.");
            g.drawString(
                "Press the \"C\" key to play again.",
                (SCREEN_WIDTH / 2) - width / 2,
                (SCREEN_HEIGHT / 2) + hgt - (hgt / 2) + 20);

        }

    }
    
}
