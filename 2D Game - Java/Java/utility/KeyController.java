package utility;

/*
 *
 * Author: Kane Kennedy
 * Last Modified: 25/05/23
 * 
 */

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class KeyController implements KeyListener {

    // Flags
    
    private Boolean hasGameStarted = false;
    private Boolean isPaused = false;
    private Boolean isGameOver = false;
    
    public Boolean upPressed = false,
                bottomPressed = false,
                leftPressed = false,
                rightPressed = false,
                fireBullet = false,
                startPressed = false;

    @Override
    public void keyPressed(KeyEvent e) {

        if (!hasGameStarted) {

            switch (e.getKeyCode()) {

                case KeyEvent.VK_C:
                    hasGameStarted = true;
                    break;

            }

        }

        if (!isPaused) {

            switch (e.getKeyCode()) {

                case KeyEvent.VK_SPACE:
                    isPaused = true;
                    break;

            }

        }

        else if (isPaused) {

            switch (e.getKeyCode()) {

                case KeyEvent.VK_SPACE:
                    isPaused = false;
                    break;

            }

        }
        
        if (isGameOver) {

            switch (e.getKeyCode()) {

                case KeyEvent.VK_C:
                    isGameOver = false;
                    break;

            }

        }

        switch (e.getKeyCode()) {

            case KeyEvent.VK_W:
                upPressed = true;
                break;

            case KeyEvent.VK_S:
                bottomPressed = true;
                break;

            case KeyEvent.VK_A:
                leftPressed = true;
                break;

            case KeyEvent.VK_D:
                rightPressed = true;
                break;

            case KeyEvent.VK_K:
                fireBullet = true;
                break;

            /*case KeyEvent.VK_SPACE:
                if (isPaused) {isPaused = false;}
                else if (!isPaused) {isPaused = true;};
                break;*/

            case KeyEvent.VK_C:
                if (startPressed) {startPressed = false;}
                else if (!startPressed) {startPressed = true;};
                break;

        }

    }

    @Override
    public void keyReleased(KeyEvent e) {

        switch (e.getKeyCode()) {

            case KeyEvent.VK_W:
                upPressed = false;
                break;

            case KeyEvent.VK_S:
                bottomPressed = false;
                break;

            case KeyEvent.VK_A:
                leftPressed = false;
                break;

            case KeyEvent.VK_D:
                rightPressed = false;
                break;

            case KeyEvent.VK_K:
                fireBullet = false;
                break;

        }
    }

    @Override
    public void keyTyped(KeyEvent e) {}

    public Boolean getHasGameStarted() {

        return hasGameStarted;

    }

    public Boolean getIsPaused() {

        return isPaused;

    }
    
    public Boolean getGameOver() {

        return isGameOver;

    }

    public void setHasGameStarted() {

        hasGameStarted = !hasGameStarted;

    }

    public void setIsPaused() {

        isPaused = !isPaused;

    }
    
    public void setGameOver() {

        isGameOver = !isGameOver;

    }
    
}
