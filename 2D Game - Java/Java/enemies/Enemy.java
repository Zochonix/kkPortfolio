package enemies;

import java.awt.Graphics;

public class Enemy {

    protected float enemyX;
    protected float enemyY;
    protected float enemySpeed;
    protected int enemyHealth;

    public Enemy(float enemyX,
    float enemyY,
    float enemySpeed,
    int enemyHealth) {

        this.enemyX = enemyX;
        this.enemyY = enemyY;
        this.enemySpeed = enemySpeed;
        this.enemyHealth = enemyHealth;

    }

    public float getEnemyX() {

        return enemyX;

    }

    public float getEnemyY() {

        return enemyY;

    }

    public int getEnemyHealth() {

        return enemyHealth;

    }

    public void setEnemyY(float newEnemyY) {

        this.enemyY = newEnemyY;

    }
    
    public void setEnemyHealth(int newHealth) {

        this.enemyHealth = newHealth;

    }

    public void updateEnemy(Graphics g) {
  
        displayEnemy(g);
        moveEnemy();
      
    }

    protected void displayEnemy(Graphics g) {}
      
    // Move the enemy up the screen.
      
    protected void moveEnemy() {
    
        enemyY -= enemySpeed;
    
    }
    
}
